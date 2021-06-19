import 'package:flutter/material.dart';
import 'package:haerangga/logic/mysql.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';


class RecruitProgramInfo extends StatefulWidget {
  RecruitProgramInfo({required this.recruitId});

  final int recruitId;

  @override
  _RecruitProgramInfoState createState() =>
      _RecruitProgramInfoState(recruitId: recruitId);
}

class _RecruitProgramInfoState extends State<RecruitProgramInfo> {
  _RecruitProgramInfoState({required this.recruitId});

  final int recruitId;
  var db = new Mysql();

  // String nation, field, org, dueDate, startDate, endDate, activities, url, contact = "";
  final Map rst = {
    'nation': "",
    'field': "",
    'org': "",
    'dueDate': "",
    'startDate': "",
    'endDate': "",
    'activities': "",
    'url': "",
    'contact': ""
  };

  void initState() {
    super.initState();

    String query =
        'SELECT * FROM haerang_ga.recruit_status JOIN haerang_ga.get_nation_org_field USING (nation_id, organization_id, field_id) WHERE recruit_id=$recruitId';
    _updateRecruitList(query);
  }

  void _updateRecruitList(String query) {
    db.getConnection().then((conn) {
      conn.query(query).then((results) {
        for (var row in results) {
          setState(() {
            rst['nation'] =
                row['nation_name_kor'] + ' (' + row['nation_name_eng'] + ')';
            rst['field'] = row['field_name'];
            rst['org'] = row['organization_name'];
            rst['dueDate'] =
                DateFormat.yMMMMd('en_US').format(row['register_due_date']);
            rst['startDate'] =
                DateFormat.yMMMMd('en_US').format(row['volunteer_start_date']);
            rst['endDate'] =
                DateFormat.yMMMMd('en_US').format(row['volunteer_end_date']);
            rst['activities'] = row['activities'];
            rst['url'] = row['url'];
            rst['contact'] = row['contact'];
          });
        }
      });
    });
  }

  Widget makeText(String contents, {bool? url}) {
    if(url == true) {
      return InkWell(
        onTap: () {
          _launchURL();
          print('tapped!');
        },
        child: Container(
          child: Text(
            contents,
            style: TextStyle(fontSize: 23.0),
          ),
          margin: EdgeInsets.symmetric(vertical: 10.0),
        )
      );
    }
    return Container(
      child: Text(
        contents,
        style: TextStyle(fontSize: 23.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.0),
    );
  }

  _launchURL() async {
    if (await canLaunch(rst['url'])) {
      await launch(rst['url']);
    } else {
      print("Cannot launch it");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('해랑가', style: TextStyle(fontSize: 30.0)),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                makeText('Nation:\n' + rst['nation']),
                makeText('Volunteering Field:\n' + rst['field']),
                makeText('Organization:\n' + rst['org']),
                makeText('Recruit Due Date:\n' + rst['dueDate']),
                makeText('Volunteer Start Date:\n' + rst['startDate']),
                makeText('Volunteer End Date:\n' + rst['endDate']),
                makeText('Activity Description:\n' + rst['activities']),
                makeText('URL:\n'+ rst['url'], url: true),
                makeText('Contact:\n' + rst['contact']),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          )),
    );
  }
}
