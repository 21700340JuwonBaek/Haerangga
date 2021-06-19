import 'package:flutter/material.dart';
//import 'package:dio/dio.dart';
import 'dart:core';
import 'package:haerangga/logic/mysql.dart';

class DetailInfoPage extends StatefulWidget {
  DetailInfoPage();
  //final String orgName;
  DetailInfoPageState createState() => new DetailInfoPageState();
}

class DetailInfoPageState extends State<DetailInfoPage> {
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  var names = [];
  var filteredNames = [];
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Search With Organization' );
  var db = new Mysql();
  var field = '';
  String selectedOrgName = '';

  DetailInfoPageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }
  //String selectedOrgName;
  @override
  void initState() {
    this._getNames();
    //selectedOrgName = widget.orgName;
    super.initState();
  }

  Widget build(BuildContext context) {
    selectedOrgName = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("$selectedOrgName's Recruiting",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List tempList = [];
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i].toLowerCase().contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filteredNames[index]),
          onTap: () {
            print(filteredNames[index]);
          },
        );
      },

    );
  }

  void _getNames() async {
    db.getConnection().then((conn) {
      String sql =
      //'SELECT field_name FROM haerang_ga.volunteer_field';
      /*'SELECT haerang_ga.recruit_status.organization_id ' +
          'FROM haerang_ga.recruit_status ' +
          'JOIN haerang_ga.v_organization ' +
          'ON haerang_ga.recruit_status.organization_id = haerang_ga.v_organization.organization_id '+
          'WHERE organization_name =' + selectedOrgName;*/
      //"SELECT haerang_ga.v_organization.organization_id FROM haerang_ga.v_organization WHERE organization_name = '$selectedOrgName'";
          "SELECT haerang_ga.recruit_status.register_due_date, haerang_ga.recruit_status.volunteer_start_date, haerang_ga.recruit_status.volunteer_end_date, haerang_ga.recruit_status.activities FROM haerang_ga.recruit_status JOIN haerang_ga.v_organization ON haerang_ga.recruit_status.organization_id = haerang_ga.v_organization.organization_id WHERE organization_name = '$selectedOrgName'";

      conn.query(sql).then((results) {
        int i = 1;
        for (var row in results) {
          setState(() {
            names.add(i.toString() + '. \n' + 'Due Date : ' + row[0].toString().substring(0, 10) + '\n' + 'Duration : ' + row[1].toString().substring(0, 10) + ' ~ ' + row[2].toString().substring(0, 10) +  '\n\n' + row[3]);
            //names.shuffle();
            filteredNames = names;
            i++;
          });
        }
      });
    });
  }
}