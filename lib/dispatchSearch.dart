import 'package:flutter/material.dart';
import 'package:haerangga/logic/mysql.dart';
import 'package:haerangga/widget/dispatchTile.dart';

class dispatchSearch extends StatefulWidget {
  final Map country;
  dispatchSearch(this.country);

  @override
  _dispatchSearchState createState() => _dispatchSearchState();
}

class _dispatchSearchState extends State<dispatchSearch> {
  int item_count = 0;
  var db = new Mysql();
  List<int> nation_id = [];
  String nation = '';
  String or = '';
  var nation_list;
  void _getNation() {
    db.getConnection().then((conn) {
      widget.country.forEach((key, value) {
        if (value == true) {
          or += ' nation_id = $key OR';
          item_count++;
        }
      });

      or = or.substring(0, or.length - 3);
      String sql =
          'SELECT nation_id,nation_name_kor FROM haerang_ga.nation WHERE' + or;
      conn.query(sql).then((results) {
        int i = 0;
        for (var row in results) {
          setState(() {
            nation_id.insert(i, row[0]);
            nation += (row[1] + ' ');
            i++;
          });
        }
      });
    });
  }

  Text showing = Text('none');
  var keys;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getNation();
  }

  Widget dispatchList() {
    return ListView.builder(
        itemCount: nation_id.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return DispatchTile(nation_id[index], nation_list[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    nation_list = nation.split(' ');
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('HAERANGGA'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(child: dispatchList()),
    );
  }
}
