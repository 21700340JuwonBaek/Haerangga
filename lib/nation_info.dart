import 'package:flutter/material.dart';
import 'package:haerangga/logic/mysql.dart';
import 'main.dart';
import 'dart:async';

void main() => runApp(Nation_info());



/// This Widget is the main application widget.
class Nation_info extends StatelessWidget {



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

class Table{
  List<String> HeadingRow =[];
  List<String> Rows =[];
  Table(this.HeadingRow, this.Rows);
}

class newPage extends StatefulWidget{
  @override
  _newPage createState() => _newPage();

}


class _newPage extends State<newPage> {

  int _counter = 0;
  var db = new Mysql();
  var nation = '';
  var id_number='0';
  String field = '';
  var check_list = new List<bool>.generate(10, (i) => false);
  var check_field = new List<bool>.generate(9, (i) => false);
  List<String> items=[];
  String query='';
  List<String> HeadingRow =[];
  List<String> Rows =[];



  @override
  Widget build(BuildContext context) {

    final table = Table(HeadingRow,Rows);
    void _getNation(id_number,field) {

      db.getConnection().then((conn) {

        String sql =
            'SELECT * FROM haerang_ga.$field WHERE $id_number';
        print('sql is $sql');
        conn.query(sql).then((results) {
          //print(results);
          var details = results;
          print(details);
          query = '$details';
          List<String> field_list = query.split("Fields:");
          for(int k = 1; k<field_list.length;k++){
            query = field_list[k];
            //print(query);
            query = query.split("{")[1].split("}")[0];  
            items = query.split(",");

            HeadingRow =[];
            Rows =[];

            for(int i=0;i<items.length;i++){            
              print(items[i]);
              HeadingRow.add(items[i].split(":")[0]);
              Rows.add(items[i].split(":")[1]);
            }
            print(HeadingRow);
            print(Rows);
            final table =  Table(HeadingRow, Rows);
          }
        });
      });

    }

    void getValue(){

      List<String> nation_Name =[];
      List<String> field_Name =[];
      //print('selected');
      for (int i=0;i<10;i++){
        //print(check_list[i]);
        if (check_list[i]) {
          switch (i) {
            case 1 :
              nation_Name.add('10');//캄보디아
              break;
            case 2 :
              nation_Name.add('1'); //nepal
              break;
            case 3 :
              nation_Name.add('4');//mongolia
              break;
            case 4 :
              nation_Name.add('7'); //vietnam
              break;
            case 5 :
              nation_Name.add('13'); //philippines
              break;
            case 6 :
              nation_Name.add('11'); //thai
              break;
            case 7 :
              nation_Name.add('2');//east timor
              break;
            case 8 :
              nation_Name.add('5');//myanmar
              break;
            case 9 :
              nation_Name.add('6');
              break;
          }
        }
      }
      for (int i=0;i<9;i++){
        if (check_field[i]) {
          switch (i) {
            case 1 :
              field_Name.add('water');
              break;
            case 2 :
              field_Name.add('embassy_and_consulate');
              break;
            case 3 :
              field_Name.add('city');
              break;
            case 4 :
              field_Name.add('literacy_rate');
              break;
            case 5 :
              field_Name.add('currency');
              break;
            case 6 :
              field_Name.add('nation');
              break;
            case 7 :
              field_Name.add('language');
              break;
            case 8 :
              field_Name.add('climate');
              break;
          }
        }
      }
     // print(nation_Name);
      Timer _timer;
      String sampleText;
      var or='';
      for(int i =0; i<nation_Name.length;i++){
        if(i>0){
          id_number = nation_Name[i];
          or+='OR ';
          or+= 'nation_id = $id_number ';
        }else if(i==0){
          id_number = nation_Name[i];
          or += 'nation_id = $id_number ';
        }
      }
      print(or);

      for(int j=0; j<field_Name.length;j++){
          field = field_Name[j];
          _getNation(or,field);

        }



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
                }
                else{
                  print('true');
                  for(int i= 0; i<10;i++) {
                    check_list[i] = true;
                  }
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
            value: check_field[0],
            onChanged: (value) {
              setState(() {
                if(check_field[0]){
                  print('false');
                  for(int i=0;i<9;i++){
                    check_field[i] = false;
                  }
                }
                else{
                  print('true');
                  for(int i= 0; i<9;i++) {
                    check_field[i] = true;
                  }
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
                      title: Text("Water"),
                      value: check_field[1],
                      onChanged: (newValue) {
                        setState(() {
                          check_field[1] = ! check_field[1];
                        });
                      },

                    ),
                    width:140,
                    height:30,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  ),
                  Container(
                    child:CheckboxListTile(
                      title: Text("Embassy"),
                      value: check_field[2],
                      onChanged: (newValue) {
                        setState(() {
                          check_field[2] = ! check_field[2];
                        });
                      },

                    ),
                    width:160,
                    height:30,

                  ),
                  Container(
                    child:CheckboxListTile(
                      title: Text("City"),
                      value: check_field[3],
                      onChanged: (newValue) {
                        setState(() {
                          check_field[3] = ! check_field[3];
                        });
                      },

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
                      value: check_field[4],
                      onChanged: (newValue) {
                        setState(() {
                          check_field[4] = ! check_field[4];
                        });
                      },

                    ),
                    width:200,
                    height:30,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  ),
                  Container(
                    child:CheckboxListTile(
                      title: Text("Currency"),
                      value: check_field[5],
                      onChanged: (newValue) {
                        setState(() {
                          check_field[5] = ! check_field[5];
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
            child: Row(
                children: <Widget>[

                  Container(
                    child:CheckboxListTile(
                      title: Text("Nation"),
                      value: check_field[6],
                      onChanged: (newValue) {
                        setState(() {
                          check_field[6] = ! check_field[6];
                        });
                      },

                    ),
                    width:140,
                    height:30,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  ),
                  Container(
                    child:CheckboxListTile(
                      title: Text("Language"),
                      value: check_field[7],
                      onChanged: (newValue) {
                        setState(() {
                          check_field[7] = ! check_field[7];
                        });
                      },

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
            value: check_field[8],
            onChanged: (newValue) {
              setState(() {
                check_field[8] = ! check_field[8];
              });
            },

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
              onPressed: () {//getValue,
                getValue();
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> SecondScreen(table:table) ));

            }

            )
        ),
      ],
    );
  }
}
class SecondScreen extends StatelessWidget {

  final Table table;
  SecondScreen({required this.table});

/*
  List<DataColumn> _getColumns(){
    List<DataColumn> dataColumn = [];
    for (var i in table.HeadingRow){
      dataColumn.add(DataColumn(label:Text(i), tooltip:i));
    }

    return dataColumn;
  }
  List<DataRow> _getRows(){
    List<DataRow> dataRow = [];
    for (var i=0;i<table.Rows.length-1;i++){
      var DataCells = table.Rows[i].split(',');
      List<DataCell> cells = [];
      for(var j=0; j<DataCells.length;j++){
        cells.add(DataCell(Text(DataCells[j])));
      }
      dataRow.add(DataRow(cells: cells));
    }

    return dataRow;
  }

  Widget _getDataTable(){
    return DataTable(
      horizontalMargin: 12.0,
      columnSpacing:28.0,
      columns: _getColumns(),
      rows: _getRows(),
    );
  }
*/
void _getDataTable(){
  print("==========================================");
  for (var i in table.HeadingRow){
    print(i);
  }

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:SingleChildScrollView(
                //_getDataTable(),
              )
            ),

            RaisedButton(
              onPressed: (){
                Navigator.pop(context);
                _getDataTable();
              },
              child: Text('Go back!'),
            ),
          ],

          ),
        ),

          /*
          child :RaisedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text('Go back!'),
          ),
        */

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
                      MaterialPageRoute(builder: (context)=> Nation_info() ));
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
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> MyApp() ));
                }
            ),
          ],
        )
    );
  }

}