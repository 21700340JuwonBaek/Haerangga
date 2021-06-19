import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DOrganizationExplain extends StatefulWidget {
  final String name, city, location, contact, url, nation;

  DOrganizationExplain(
      this.name, this.city, this.location, this.contact, this.url, this.nation);
  @override
  DOrganizationExplainState createState() => DOrganizationExplainState();
}

class DOrganizationExplainState extends State<DOrganizationExplain> {
  _launchURL() async {
    if (await canLaunch(widget.url)) {
      await launch(widget.url);
    } else {
      print("Cannot launch it");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('해랑가'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(
                      20,
                      MediaQuery.of(context).size.height * 0.15,
                      20,
                      MediaQuery.of(context).size.height * 0.01),
                  child: Text(
                    '봉사 기관 명 : ' + widget.name,
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(
                      20,
                      MediaQuery.of(context).size.height * 0.01,
                      20,
                      MediaQuery.of(context).size.height * 0.01),
                  child: Text(
                    '국가 이름 : ' + widget.nation,
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(
                      20,
                      MediaQuery.of(context).size.height * 0.01,
                      20,
                      MediaQuery.of(context).size.height * 0.01),
                  child: Text(
                    '봉사 기관 도시 : ' + widget.city,
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(
                    20,
                    MediaQuery.of(context).size.height * 0.01,
                    20,
                    MediaQuery.of(context).size.height * 0.01),
                child: Text(
                  '봉사 위치 : ' + widget.location,
                  overflow: TextOverflow.visible,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(
                      20,
                      MediaQuery.of(context).size.height * 0.01,
                      20,
                      MediaQuery.of(context).size.height * 0.07),
                  child: Text(
                    '봉사 기관 연락처 : ' + widget.contact,
                    style: TextStyle(fontSize: 20),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _launchURL();
                    },
                    child: Text('Go to the webpage'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.orange)),
                  )
                ],
              )
            ],
          )),
    );
  }
}