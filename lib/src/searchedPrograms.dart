import 'package:flutter/material.dart';
import 'package:haerangga/logic/mysql.dart';
import 'package:haerangga/src/recruitProgramInfo.dart';
import 'package:intl/intl.dart';

class SearchedPrograms extends StatefulWidget {
  // const RecruitStatus({Key? key}) : super(key: key);
  SearchedPrograms(
      {required this.nation, required this.field, required this.org});

  final List<bool> nation;
  final List<bool> field;
  final List<bool> org;

  @override
  _SearchedPrograms createState() =>
      _SearchedPrograms(nation: nation, field: field, org: org);
}

class _SearchedPrograms extends State<SearchedPrograms> {
  _SearchedPrograms(
      {required this.nation, required this.field, required this.org});

  final List<bool> nation;
  final List<bool> field;
  final List<bool> org;
  late String query = "";
  List<String> recruitList = [];
  final List<bool> selectedRecruit = [];

  @override
  void initState() {
    super.initState();
    query = _interpretToQuery();
    _updateRecruitList();
    for(int i = 0; i < recruitList.length; i++) {
      selectedRecruit.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(nation.toString());
    // print(recruitList.toString());
    // print(query);

    return Scaffold(
        appBar: AppBar(
          title: Text('HAERANGGA', style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          )),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: ListView.builder(
            itemCount: recruitList.length,
            padding: const EdgeInsets.all(20.0),
            itemBuilder: (context, i) {
              //if (i.isOdd) return Divider(); /*2*/
              // final index = i ~/ 2; /*3*/
              // if (index >= recruitList.length) return Container();
              return _buildRow(recruitList[i], i);
            }));
  }

  Widget _buildRow(String list, int index) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.black54),
          ),
        ),
        child: ListTile(
          title: Text(
            list,
            style: const TextStyle(fontSize: 23.0),
            strutStyle: const StrutStyle(height: 2.5),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>RecruitProgramInfo(recruitId: index+1))
            );
          }
    ));
  }

  var db = new Mysql();
  var nations;

  String _interpretToQuery() {
    bool isAllSelected = false;
    bool isAllNotSelected = false;
    String query =
        'SELECT * FROM haerang_ga.recruit_status JOIN haerang_ga.get_nation_org_field USING (nation_id, organization_id, field_id) ';

    if (nation[0] == true && field[0] == true && org[0] == true) {
      isAllSelected = true;
    }
    if (!nation.contains(true) ||
        !field.contains(true) ||
        !nation.contains(true)) {
      isAllNotSelected = true;
      query = "SELECT null";
    }

    if (!isAllSelected && !isAllNotSelected) {
      // because if all selected, where clause is not needed.
      query += 'WHERE ';

      // nation_id IN (...)
      if (nation[0] != true) {
        query += 'nation_id IN(';
        for (int i = 1; i < nation.length; i++) {
          if (nation[i] == true) query += i.toString() + ',';
        }
        query = query.substring(0, query.length - 1);
        query += ') ';
      }

      if (nation[0] != true && (field[0] != true || org[0] != true)) {
        query += 'AND ';
      }

      // field_id IN (...)
      if (field[0] != true) {
        query += 'field_id IN(';
        for (int i = 1; i < field.length; i++) {
          if (field[i] == true) query += i.toString() + ',';
        }
        query = query.substring(0, query.length - 1);
        query += ') ';
      }

      if (field[0] != true && org[0] != true) {
        query += 'AND ';
      }

      // organization_id IN (...)
      if (org[0] != true) {
        query += 'organization_id IN(';
        for (int i = 1; i < org.length; i++) {
          if (org[i] == true) query += i.toString() + ',';
        }
        query = query.substring(0, query.length - 1);
        query += ')';
      }
    }
    query += ';';

    return query;
  }

  void _updateRecruitList() {
    // List<String> recruitList = [];
    String temp = "";
    db.getConnection().then((conn) {
      conn.query(query).then((results) {
        for (var row in results) {
          temp = "";
          var startDate =
              DateFormat.yMMMMd('en_US').format(row['volunteer_start_date']);
          var endDate =
              DateFormat.yMMMMd('en_US').format(row['volunteer_end_date']);
          temp = temp +
              "Org: " +
              row['organization_name'] +
              "\nNation: " +
              row['nation_name_kor'] +
              "\nFrom: " +
              startDate +
              "\nTo: " +
              endDate;
          setState(() {
            recruitList.add(temp);
          });
          // print(recruitList.toString());
        }
      });
    });
  }
}
