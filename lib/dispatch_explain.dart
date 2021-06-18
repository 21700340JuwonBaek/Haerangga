import 'package:flutter/material.dart';
import 'package:haerangga/logic/mysql.dart';
import 'package:haerangga/widget/d_organization_tile.dart';

class dispatch_explain extends StatefulWidget {
  //const dispatch_explain({Key? key}) : super(key: key);

  final String nation;
  final int nation_id;

  dispatch_explain({
    required this.nation_id,
    required this.nation,
  });

  @override
  _dispatch_explainState createState() => _dispatch_explainState();
}

class _dispatch_explainState extends State<dispatch_explain> {
  List<String> city = [];
  List<String> location = [];
  List<String> contact = [];
  List<String> url = [];
  List<String> name = [];
  var db = new Mysql();
  int myIndex = 0;
  String nation = '';

  @override
  void initState() {
    int nation_id = widget.nation_id;
    print(nation_id);
    // TODO: implement initState
    super.initState();
    String query =
        'SELECT d_organization_name, city_name_kor, location, contact, web_site, nation_name_kor FROM haerang_ga.d_organization,' +
            ' haerang_ga.city, haerang_ga.nation WHERE d_organization.nation_id = $nation_id AND d_organization.city_id = city.city_id AND nation.nation_id = $nation_id';

    db.getConnection().then((conn) {
      conn.query(query).then((result) {
        int i = 0;
        for (var row in result) {
          print(row);
          setState(() {
            if (row[0] == null) {
              name.insert(i, '');
            } else {
              name.insert(i, row[0]);
            }
            if (row[1] == null) {
              city.insert(i, '');
            } else {
              city.insert(i, row[1]);
            }
            if (row[2] == null) {
              location.insert(i, '');
            } else {
              location.insert(i, row[2]);
            }
            if (row[3] == null) {
              contact.insert(i, '');
            } else {
              contact.insert(i, row[3]);
            }
            if (row[4] == null) {
              url.insert(i, '');
            } else {
              url.insert(i, row[4]);
            }
            if (row[5] != null) {
              nation = row[5];
            }
            i++;
          });
        }
        myIndex = i;
      });
    });
  }

  Widget d_organization_list() {
    return ListView.builder(
        itemCount: name.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return d_organization_tile(name[index], city[index], location[index],
              contact[index], url[index], nation);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('해랑가'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Container(child: d_organization_list()),
    );
  }
}
