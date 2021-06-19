import 'package:flutter/material.dart';
import 'package:haerangga/logic/mysql.dart';
import 'package:haerangga/src/searchedPrograms.dart';
export 'package:haerangga/src/recruitStatus.dart';

//
// void main() {
//   runApp(MaterialApp(
//     title: '해랑가',
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('해랑가'),
//       ),
//       body: RecruitStatus(),
//     ),
//   ));
// }

class RecruitStatus extends StatefulWidget {
  // const RecruitStatus({Key? key}) : super(key: key);
  @override
  _RecruitStatusState createState() => _RecruitStatusState();
}

class _RecruitStatusState extends State<RecruitStatus> {
  @override
  Widget build(BuildContext context) {
    // _getNation();

    return Scaffold(
        appBar: AppBar(
          title: Text('해랑가', style: TextStyle(fontSize: 30.0)),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                child: Column(
              children: <Widget>[
                Container(
                    child: Text("Recruiting\nVolunteer Program",
                        style: TextStyle(fontSize: 40.0)),
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 0)),
                Container(width: 400, child: Divider(thickness: 1, color: Colors.black,)),
                Container(child: makeNation(), margin: EdgeInsets.all(8.0)),
                Container(width: 400, child: Divider(thickness: 1, color: Colors.black,)),
                Container(child: makeField(), margin: EdgeInsets.all(8.0)),
                Container(width: 400, child: Divider(thickness: 1, color: Colors.black,)),
                Container(child: makeOrganization(), margin: EdgeInsets.all(8.0)),
                Container(width: 400, child: Divider(thickness: 1, color: Colors.black,)),
                Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.fromLTRB(0, 10, 50, 100),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        primary: Colors.orange,
                      ),
                      child: const Text('Search'),
                      onPressed: () {
                        setState(() {
                          // Search -> navigate
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>SearchedPrograms(nation: selectedNation, field: selectedField, org: selectedOrg))
                          );
                        });
                      },
                    ))
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ))));
  }

  var db = new Mysql();
  var nationAll = false,
      fieldAll = false,
      organizationAll = false; // for select all
  var nation;

  // late List _nation;

  // 0th element means select all!
  final List<bool> selectedNation = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];
  final List<bool> selectedField = [false, false, false, false, false, false, false, false];
  final List<bool> selectedOrg = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];

  Widget makeNation() {
    //Array 2d Dart for later code.
    // final nationTitleRows = List.generate(3, (i) => List(3, null, growable: false), growable: true);
    // nationTitleRows[0][1] = "deneme";
    // print(nationTitleRows);

    return Row(
      children: [
        makeText('Nation'),
        Column(children: <Widget>[
          Row(children: <Widget>[
            Checkbox(
              value: selectedNation[0],
              visualDensity: VisualDensity.compact,
              activeColor: Colors.orange,
              onChanged: (value) {
                setState(() {
                  selectedNation[0] = value!;
                  if(selectedNation[0]) {
                    for (int i = 0; i < 15; i++) selectedNation[i] = true;
                  } else {
                    for (int i = 0; i < 15; i++) selectedNation[i] = false;
                  }
                });
              },
            ),
            makeText('Select All'),
          ]),
          makeOneRow(selectedNation, '네팔', 1, '동티모르', 2, '라오스', 3),
          makeOneRow(selectedNation, '몽골', 4, '미얀마', 5, '방글라데시', 6),
          makeOneRow(selectedNation, '베트남', 7, '스리랑카', 8, '인도네시아', 9),
          makeOneRow(selectedNation, '캄보디아', 10, '태국', 11, '파키스탄', 12),
          makeOneRow(selectedNation, '필리핀', 13, '부탄', 14),
        ], crossAxisAlignment: CrossAxisAlignment.start)
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  Widget makeField() {
    return Row(
      children: [
        makeText('Field'),
        Column(children: <Widget>[
          Row(children: <Widget>[
            Checkbox(
              value: selectedField[0],
              visualDensity: VisualDensity.compact,
              activeColor: Colors.orange,
              onChanged: (value) {
                setState(() {
                  selectedField[0] = value!;
                  if(selectedField[0]) {
                    for (int i = 0; i < 8; i++) selectedField[i] = true;
                  } else {
                    for (int i = 0; i < 8; i++) selectedField[i] = false;
                  }
                });
              },
            ),
            makeText('Select All'),
          ]),
          makeOneRow(selectedField, '공공행정', 1, '교육', 2, '보건', 3),
          makeOneRow(selectedField, '농림수산', 4, '산업에너지', 5),
          makeOneRow(selectedField, '기타', 6, '긴급구호', 7),
        ], crossAxisAlignment: CrossAxisAlignment.start)
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  Widget makeOrganization() {
    return Row(
      children: [
        makeText('Organization'),
        Column(children: <Widget>[
          Row(children: <Widget>[
            Checkbox(
              value: selectedOrg[0],
              visualDensity: VisualDensity.compact,
              activeColor: Colors.orange,
              onChanged: (value) {
                setState(() {
                  selectedOrg[0] = value!;
                  if(selectedOrg[0]) {
                    for (int i = 0; i < 16; i++) selectedOrg[i] = true;
                  } else {
                    for (int i = 0; i < 16; i++) selectedOrg[i] = false;
                  }
                });
              },
            ),
            makeText('Select All'),
          ]),
          makeOneRow(selectedOrg, 'KOICA', 1, '더나은 세상', 2),
          makeOneRow(selectedOrg, '태평양아시아협회', 3),
          makeOneRow(selectedOrg, '한국 해비타트', 4),
          makeOneRow(selectedOrg, '한국대학사회봉사협의회', 5),
          makeOneRow(selectedOrg, '대한적십자사', 6),
          makeOneRow(selectedOrg, '코피온', 7),
          makeOneRow(selectedOrg, '국제아동돕기연합', 8),
          makeOneRow(selectedOrg, '한국국제시민봉사회', 9),
          makeOneRow(selectedOrg, 'KT&G복지재단', 10),
          makeOneRow(selectedOrg, '월드비전', 11, '더 멋진 세상', 12),
          makeOneRow(selectedOrg, '위세이버', 13),
          makeOneRow(selectedOrg, 'Life of the children', 14),
          makeOneRow(selectedOrg, '지미션', 15),
        ], crossAxisAlignment: CrossAxisAlignment.start)
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  Widget makeOneRow(List<bool> targetList, String val1, int flag1,
      [String val2 = "", int flag2 = 0, String val3 = "", int flag3 = 0]) {
    List<Widget> row = [];

    row.add(Row(children: <Widget>[
      Checkbox(
        value: targetList[flag1],
        visualDensity: VisualDensity.compact,
        activeColor: Colors.orange,
        onChanged: (value) {
          setState(() {
            targetList[flag1] = value!;
            if(!targetList[flag1] && targetList[0]) {
              for(int i = 0; i < targetList.length; i++) targetList[i] = false;
            }
          });
        },
      ),
      makeText(val1),
    ]));

    if (val2 != "") {
      row.add(Row(children: <Widget>[
        Checkbox(
          value: targetList[flag2],
          visualDensity: VisualDensity.compact,
          activeColor: Colors.orange,
          onChanged: (value) {
            setState(() {
              targetList[flag2] = value!;
              if(!targetList[flag2] && targetList[0]) {
                for(int i = 0; i < targetList.length; i++) targetList[i] = false;
              }
            });
          },
        ),
        makeText(val2),
      ]));
    }

    if (val3 != "") {
      row.add(Row(children: <Widget>[
        Checkbox(
          value: targetList[flag3],
          visualDensity: VisualDensity.compact,
          activeColor: Colors.orange,
          onChanged: (value) {
            setState(() {
              targetList[flag3] = value!;
              if(!targetList[flag3] && targetList[0]) {
                for(int i = 0; i < targetList.length; i++) targetList[i] = false;
              }
            });
          },
        ),
        makeText(val3),
      ]));
    }

    return Row(
      children: row,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  Widget makeText(String title, {double? width, double? height}) {
    return Container(
      child: Text(
        title,
        style: TextStyle(fontSize: 20.0),
      ),
      width: width,
      height: height,
      margin: EdgeInsets.all(0.0),
    );
  }
}
