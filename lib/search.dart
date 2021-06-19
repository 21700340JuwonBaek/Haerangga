import 'package:flutter/material.dart';
//import 'package:dio/dio.dart';
import 'dart:core';
import 'package:haerangga/logic/mysql.dart';
import 'detailInfo.dart';

class SearchPage extends StatefulWidget {
  SearchPage();
  SearchPageState createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  var names = [];
  var filteredNames = [];
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Search With Organization' );
  var db = new Mysql();
  var field = '';

  SearchPageState() {
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

  @override
  void initState() {
    this._getNames();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  PreferredSizeWidget _buildBar(BuildContext context) {
    return new AppBar(
      backgroundColor: Colors.deepOrangeAccent,
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),

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
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filteredNames[index]),
          onTap: () {
            print(filteredNames[index]);
            Navigator.pushNamed(context, '/detailInfo', arguments: filteredNames[index]);
            /*Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return DetailInfoPage(filteredNames[index]);
              }
            ));*/
          },
        );
      },
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search),
              hintText: 'Search...'
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text( 'Search with Organization' );
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  void _getNames() async {
    db.getConnection().then((conn) {
      String sql =
      //'SELECT field_name FROM haerang_ga.volunteer_field';
          'SELECT organization_name FROM haerang_ga.v_organization';
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            names.add(row[0]);
            names.shuffle();
            filteredNames = names;
          });
        }
      });
    });
  }

  void _getDetailInfo() async {
    db.getConnection().then((conn) {
      String sql =
      //'SELECT field_name FROM haerang_ga.volunteer_field';
      //'SELECT organization_id FROM haerang_ga.recruit_status JOIN haerang_ga.v_organization ON haerang_ga.recruit_status.organization_id = haerang_ga.v_organization.organization_id WHERE ';
          'SELECT organization_name FROM haerang_ga.v_organization';
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            names.add(row[0]);
            names.shuffle();
            filteredNames = names;
          });
        }
      });
    });
  }
}