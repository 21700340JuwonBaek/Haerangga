import 'package:flutter/material.dart';
import 'dart:core';
import 'dispatch.dart';

class HomePage extends StatefulWidget {
  HomePage();
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  var isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.all(20.0),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Haerangga',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ))),
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                semanticLabel: 'home',
                color: Colors.deepOrangeAccent,
              ),
              title: Text('Home'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
              selected: true,
            ),
            ListTile(
              leading: Icon(
                Icons.language,
                semanticLabel: 'nation_info',
                color: Colors.deepOrangeAccent,
              ),
              title: Text('Nation Info.'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, '/nation_info');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.search,
                semanticLabel: 'recruiting',
                color: Colors.deepOrangeAccent,
              ),
              title: Text('Recruiting'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                semanticLabel: 'dispatch_stat.',
                color: Colors.deepOrangeAccent,
              ),
              title: Text('Dispatch Stat.'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                //Navigator.pushNamed(context, '/mypage');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dispatch()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'HAERANGGA',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          /*IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
              Scaffold.of(context).openEndDrawer();
              //Navigator.pushNamed(context, '/search');
            },
          ),
          */
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.search),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.all(20.0),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Search With...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ))),
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                semanticLabel: 'Field name',
                color: Colors.deepOrangeAccent,
              ),
              title: Text('Field name'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, '/searchField');
              },
              selected: true,
            ),
            ListTile(
              leading: Icon(
                Icons.language,
                semanticLabel: 'Organization name',
                color: Colors.deepOrangeAccent,
              ),
              title: Text('Organization name'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, '/search');
              },
            ),
          ],
        ),
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 0.0),
          child: Center(
              child: Column(children: [
            SizedBox(
              height: 150,
            ),
            SizedBox(
                height: 320,
                width: 400,
                child: Image.asset('images/home_earth.png')),
            Text(
              '해외봉사,',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '해랑가랑 가자!',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold),
            ),
          ])),
        ),
      ]),
      resizeToAvoidBottomInset: false,
    );
  }
}
