import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '해랑가',
    home: Scaffold(
      appBar: AppBar(
        title: Text('해랑가'),
      ),
      body: RecruitStatus(),
    ),
  ));
}

class RecruitStatus extends StatefulWidget {
  // const RecruitStatus({Key? key}) : super(key: key);
  @override
  _RecruitStatusState createState() => _RecruitStatusState();
}

class _RecruitStatusState extends State<RecruitStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Container(
                child: Text("Recruiting\nVolunteer Program",
                    style: TextStyle(fontSize: 40.0)),
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 0)),
            Container(
                width: 400,
                child: Divider(
                  thickness: 1,
                  color: Colors.black,
                )),
            Container(child: makeNation(), margin: EdgeInsets.all(8.0)),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        ));
  }

  bool nationAll = false; // for select all

  Widget makeNation() {
    //Array 2d Dart for later code.
    final nationTitleRows = List.generate(3, (i) => List(3), growable: true);
    nationTitleRows[0][1] = "deneme";
    print(nationTitleRows);

    return Row(
      children: [
        makeText('Nation', width: 80, height: 50),
        Column(children: <Widget>[
          Row(children: <Widget>[
            Checkbox(
              value: nationAll,
              onChanged: (value) {
                setState(() {
                  nationAll = value;
                });
              },
            ),
            makeText('Select All', width: 100, height: 30),
          ]),
          makeOneRow('캄보디아', '네팔'),
          makeOneRow('필리핀', '동티모르'),
          makeOneRow('방글라데시', '방글라데시')
        ], crossAxisAlignment: CrossAxisAlignment.start)
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  Widget makeOneRow(String nation1, String nation2) {
    List<Widget> row = [];
    List<bool> selectedNation = [false, false];
    for (var i = 0; i < 2; i++) {
      row.add(Row(children: <Widget>[
        Checkbox(
          value: selectedNation[i],
          onChanged: (value) {
            setState(() {
              selectedNation[i] = value;
            });
          },
        ),
        makeText(nation1, width: 100, height: 30),
      ]));
    }

    return Row(
      children: row,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  Widget makeText(String title, {double width, double height}) {
    return Container(
      child: Text(
        title,
        style: TextStyle(fontSize: 20.0),
      ),
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    );
  }
}
