import 'package:flutter/material.dart';
import 'package:haerangga/dispatchSearch.dart';
import 'package:haerangga/logic/mysql.dart';

class Dispatch extends StatefulWidget {
  @override
  _DispatchState createState() => _DispatchState();
}

class _DispatchState extends State<Dispatch> {
  void all_false(Map<int, dynamic> country, bool? res) {
    for (int i = 1; i <= country.length; i++) {
      country.update(i, (value) => res);
    }
  }

  Map<int, dynamic> country = {
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
    6: false,
    7: false,
    8: false,
    9: false,
    10: false,
    11: false,
    12: false,
    13: false,
    14: false,
  };
  bool? all = false,
      NP = false,
      TL = false,
      LA = false,
      MN = false,
      MM = false,
      BD = false,
      VN = false,
      LK = false,
      ID = false,
      KH = false,
      TH = false,
      PK = false,
      PH = false,
      BT = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('해랑가'),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: Container(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: all,
                          onChanged: (bool? value) {
                            setState(() {
                              all = value;
                              all_false(country, value);
                              NP = value;
                              TL = value;
                              LA = value;
                              MN = value;
                              MM = value;
                              BD = value;
                              VN = value;
                              LK = value;
                              ID = value;
                              KH = value;
                              TH = value;
                              PK = value;
                              PH = value;
                              BT = value;
                            });
                          }),
                      Text('Select All', style: TextStyle(fontSize: 30))
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Row(
                      children: [
                        Checkbox(
                            value: NP,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == false) all = false;
                                NP = value;
                                country.update(1, (value) => NP);
                              });
                            }),
                        Text('네팔', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: TL,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == false) all = false;
                                TL = value;
                                country.update(2, (value) => TL);
                              });
                            }),
                        Text('동티모르', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: LA,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == false) all = false;
                                LA = value;
                                country.update(3, (value) => LA);
                              });
                            }),
                        Text('라오스', style: TextStyle(fontSize: 20))
                      ],
                    ),
                  ]), ///////////////////////////
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Row(
                      children: [
                        Checkbox(
                            value: MN,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == false) all = false;
                                MN = value;
                                country.update(4, (value) => MN);
                              });
                            }),
                        Text('몽골', style: TextStyle(fontSize: 20))
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: MM,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == false) all = false;
                                MM = value;
                                country.update(5, (value) => MM);
                              });
                            }),
                        Text('미얀마', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: BD,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == false) all = false;
                                BD = value;
                                country.update(6, (value) => BD);
                              });
                            }),
                        Text('방글라데시', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Row(
                      children: [
                        Checkbox(
                            value: VN,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == false) all = false;
                                VN = value;
                                country.update(7, (value) => VN);
                              });
                            }),
                        Text('베트남', style: TextStyle(fontSize: 20))
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: LK,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == false) all = false;
                                LK = value;
                                country.update(8, (value) => LK);
                              });
                            }),
                        Text('스리랑카', style: TextStyle(fontSize: 20))
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: ID,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == false) all = false;
                                ID = value;
                                country.update(9, (value) => ID);
                              });
                            }),
                        Text('인도네시아', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Row(
                      children: [
                        Checkbox(
                            value: KH,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == false) all = false;
                                KH = value;
                                country.update(10, (value) => KH);
                              });
                            }),
                        Text('캄보디아', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: TH,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == false) all = false;
                                TH = value;
                                country.update(11, (value) => TH);
                              });
                            }),
                        Text('태국', style: TextStyle(fontSize: 20))
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: PK,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == false) all = false;
                                PK = value;
                                country.update(12, (value) => PK);
                              });
                            }),
                        Text('파키스탄', style: TextStyle(fontSize: 20))
                      ],
                    ),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Row(
                      children: [
                        Checkbox(
                            value: PH,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == false) all = false;
                                PH = value;
                                country.update(13, (value) => PH);
                              });
                            }),
                        Text('필리핀', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: BT,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == false) all = false;
                                BT = value;
                                country.update(14, (value) => BT);
                              });
                            }),
                        Text('부탄', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ]),
                  Divider(
                    color: Colors.black,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => dispatchSearch(country)));
                    },
                    child: Text(
                      'Search',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            )));
  }
}