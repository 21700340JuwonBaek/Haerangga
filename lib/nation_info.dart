import 'package:flutter/material.dart';


void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    bool _ischecked = false;
    return MaterialApp(
      title: 'Haerangga',
      home: Scaffold(
          appBar: AppBar(
            title:Text('해랑가',
                style:TextStyle(fontSize:40,fontWeight:FontWeight.bold,color:Colors.orange )),
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color:Colors.orange),
            actions: [
              IconButton(
                icon: Icon(Icons.search,size: 40.0,
                    color: Colors.orange),
                onPressed: () {
                  print('search clicked');
                },
              )
            ],
          ),
          drawer:Drawer(
            child: MyDrawer(),
          ),
          body: newPage()
      ),
    );
  }


}

class newPage extends StatefulWidget{
  @override
  _newPage createState() => _newPage();

}


class _newPage extends State<newPage> {

  var check_list = new List<bool>.generate(10, (i) => false);


  @override
  Widget build(BuildContext context) {

    void getValue(){

      List<String> nation_Name =[];
      //print('selected');
      for (int i=0;i<10;i++){
        //print(check_list[i]);
        if (check_list[i]) {
          switch (i) {
            case 1 :
              nation_Name.add('Cambodia');
              break;
            case 2 :
              nation_Name.add('Nepal');
              break;
            case 3 :
              nation_Name.add('Mongolia');
              break;
            case 4 :
              nation_Name.add('Vietnam');
              break;
            case 5 :
              nation_Name.add('Philippines');
              break;
            case 6 :
              nation_Name.add('Thailand');
              break;
            case 7 :
              nation_Name.add('East Timor');
              break;
            case 8 :
              nation_Name.add('Myanmar');
              break;
            case 9 :
              nation_Name.add('Bangladesh');
              break;
          }
        }
      }
      print(nation_Name);



    }


    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:<Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 80, 0, 20),
          child: Container(
            child: Center(
              child: Text('Nation.Info',
                style:TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),),),
            width: 300,
            height:50,
            //
            //margin: EdgeInsets.all(10.0),
          ),
        ),
        Container(
            child:Text('Nation',
                style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            width:100,
            height:50,
            padding: EdgeInsets.fromLTRB(15, 20, 0, 0)
        ),
        Container(
          child:CheckboxListTile(
            title: Text("SELECT ALL"),
            value: check_list[0],
            onChanged: (value) {
              setState(() {
                if(check_list[0]){
                  print('false');
                  for(int i=0;i<10;i++){
                    check_list[i] = false;
                  }
                  /*
                  _isChecked0 = false;
                  _isChecked1 = false;
                  _isChecked2 = false;
                  _isChecked3 = false;
                  _isChecked4 = false;
                  _isChecked5 = false;
                  _isChecked6 = false;
                  _isChecked7 = false;
                  _isChecked8 = false;
                  _isChecked9 = false;
                   */
                }
                else{
                  print('true');
                  for(int i= 0; i<10;i++){
                    check_list[i] = true;
                  }
                  /*
                  _isChecked0 = true;
                  _isChecked1 = true;
                  _isChecked2 = true;
                  _isChecked3 = true;
                  _isChecked4 = true;
                  _isChecked5 = true;
                  _isChecked6 = true;
                  _isChecked7 = true;
                  _isChecked8 = true;
                  _isChecked9 = true;
                   */
                }




              });
            },

          ),
          width: 200,
          height:30,
          //margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        ),


        Container(
            child: Row(
                children: <Widget>[

                  Container(
                    child:CheckboxListTile(
                      title: Text("캄보디아"),
                      value: check_list[1],
                      onChanged: (value) {
                        setState(() {
                          check_list[1] = !check_list[1];

                        });
                      },

                    ),
                    width:150,
                    height:30,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  ),
                  Container(
                    child:CheckboxListTile(
                      title: Text("네팔"),
                      value: check_list[2],
                      onChanged: (value) {
                        setState(() {
                          check_list[2] = !check_list[2];

                        });
                      },

                    ),
                    width:130,
                    height:30,

                  ),
                  Container(
                    child:CheckboxListTile(
                      title: Text("몽골"),
                      value: check_list[3],
                      onChanged: (value) {
                        setState(() {
                          check_list[3] = !check_list[3];

                        });
                      },

                    ),
                    width:130,
                    height:30,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  ),

                ]
            )
        ),
        Container(
            child: Row(
                children: <Widget>[
                  Container(
                    child:CheckboxListTile(
                      title: Text("베트남"),
                      value: check_list[4],
                      onChanged: (value) {
                        setState(() {
                          check_list[4] = !check_list[4];

                        });
                      },
                    ),
                    width:150,
                    height:30,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  ),
                  Container(
                    child:CheckboxListTile(
                      title: Text("필리핀"),
                      value: check_list[5],
                      onChanged: (value) {
                        setState(() {
                          check_list[5] = !check_list[5];
                        });
                      },

                    ),
                    width:140,
                    height:30,

                  ),
                  Container(
                    child:CheckboxListTile(
                      title: Text("태국"),
                      value: check_list[6],
                      onChanged: (value) {
                        setState(() {
                          check_list[6] = !check_list[6];
                        });
                      },
                    ),
                    width:130,
                    height:30,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  ),

                ]
            )
        ),Container(
            child: Row(
                children: <Widget>[
                  Container(
                    child:CheckboxListTile(
                      title: Text("동티모르"),
                      value: check_list[7],
                      onChanged: (value) {
                        setState(() {
                          check_list[7] = !check_list[7];
                        });
                      },
                    ),
                    width:145,
                    height:30,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  ),
                  Container(
                    child:CheckboxListTile(
                      title: Text("미얀마"),
                      value: check_list[8],
                      onChanged: (value) {
                        setState(() {
                          check_list[8] = !check_list[8];
                        });
                      },
                    ),
                    width:130,
                    height:30,

                  ),


                ]
            )
        ),
        Container(
            child: Row(
                children: <Widget>[
                  Container(
                    child:CheckboxListTile(
                      title: Text("방글라데시"),
                      value: check_list[9],
                      onChanged: (value) {
                        setState(() {
                          check_list[9] = ! check_list[9];
                        });
                      },

                    ),
                    width:160,
                    height:30,

                  ),

                ]
            )
        ),
        Container(
          child:SizedBox(
            height:30,
            width:50,
            //child:Container(color:Colors.blue),
          ),
        ),
        Container(
          height:1.0,
          width:500.0,
          color:Colors.orange,
        ),
        Container(
            child:Text('Field',
                style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            width:100,
            height:50,
            padding: EdgeInsets.fromLTRB(15, 20, 0, 0)
        ),
        Container(
          child:CheckboxListTile(
            title: Text("SELECT ALL"),
            value: true,
            onChanged: (newValue) {  },

          ),
          width: 200,
          height:30,
          //margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        ),
        Container(
            child: Row(
                children: <Widget>[

                  Container(
                    child:CheckboxListTile(
                      title: Text("Water"),
                      value: true,
                      onChanged: (newValue) {  },

                    ),
                    width:140,
                    height:30,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  ),
                  Container(
                    child:CheckboxListTile(
                      title: Text("Embassy"),
                      value: true,
                      onChanged: (newValue) {  },

                    ),
                    width:160,
                    height:30,

                  ),
                  Container(
                    child:CheckboxListTile(
                      title: Text("City"),
                      value: true,
                      onChanged: (newValue) {  },

                    ),
                    width:120,
                    height:30,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  ),

                ]
            )
        ),
        Container(
            child: Row(
                children: <Widget>[

                  Container(
                    child:CheckboxListTile(
                      title: Text("Literacy rate"),
                      value: true,
                      onChanged: (newValue) {  },

                    ),
                    width:200,
                    height:30,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  ),
                  Container(
                    child:CheckboxListTile(
                      title: Text("Currency"),
                      value: true,
                      onChanged: (newValue) {  },

                    ),
                    width:160,
                    height:30,

                  ),
                ]
            )
        ),
        Container(
            child: Row(
                children: <Widget>[

                  Container(
                    child:CheckboxListTile(
                      title: Text("Nation"),
                      value: true,
                      onChanged: (newValue) {  },

                    ),
                    width:140,
                    height:30,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  ),
                  Container(
                    child:CheckboxListTile(
                      title: Text("Language"),
                      value: true,
                      onChanged: (newValue) {  },

                    ),
                    width:170,
                    height:30,

                  ),


                ]
            )
        ),
        Container(
          child:CheckboxListTile(
            title: Text("Climate"),
            value: true,
            onChanged: (newValue) {  },

          ),
          width:150,
          height:30,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        ),
        Container(
          child:SizedBox(
            height:30,
            width:50,
            //child:Container(color:Colors.blue),
          ),
        ),
        Container(
          height:1.0,
          width:500.0,
          color:Colors.orange,

        ),
        Container(
            child:ElevatedButton(
              child: Text('SELECT',style:TextStyle(fontSize : 30, fontWeight: FontWeight.bold)),
              onPressed: getValue,



            )
        ),
      ],
    );
  }
}


class MyClass {
  String title;
  bool value;
  MyClass(this.title, this.value);
  @override
  String toString() {
    return 'MyClass{title: $title, value: $value}';
  }
}


class MyDrawer extends StatefulWidget{
  @override
  _MyDrawer createState(){
    print("MyDrawer - createState() called");
    return _MyDrawer();
  }

}

class _MyDrawer extends State<MyDrawer>{

  @override
  Widget build(BuildContext context) {

    print("MyDrawer - build() called");
    return Drawer(
        child:ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child:Text(""),
              decoration: BoxDecoration(
                  color:Colors.orange
              ),
            ),
            ListTile(
                title:Text("Nation Info.",
                    style:TextStyle(fontSize:25)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> MyApp() ));
                }

            ),
            ListTile(
              title:Text("Recruiting",
                  style:TextStyle(fontSize:25)),
            ),
            ListTile(
              title:Text("Dispatch Stat.",
                  style:TextStyle(fontSize:25)),
            ),
            ListTile(
              title:Text("Home",
                  style:TextStyle(fontSize:25)),
            ),
          ],
        )
    );
  }

}