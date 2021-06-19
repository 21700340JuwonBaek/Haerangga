import 'package:flutter/material.dart';

import 'home.dart';
import 'search.dart';
import 'searchField.dart';
import 'detailInfo.dart';
import 'detailInfoField.dart';
//import 'dispatchMain.dart';

/*
import 'recruiting.dart';
import 'search.dart';
*/

class HaeranggaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haerangga',
      home: HomePage(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/search': (context) => SearchPage(),
        '/searchField': (context) => SearchFieldPage(),
        '/detailInfo': (context) => DetailInfoPage(),
        '/detailInfoField': (context) => DetailInfoFieldPage(),
        //'/dispatchMain' : (context) => DispatchMainPage(),
        //'/nation_info': (context) => SearchPage(),
        //'/recruiting': (context) => RecruitingPage(),
        //'/dispatch_stat': (context) => DispatchPage(),
      },
      //onGenerateRoute: _getRoute,
    );
  }
}