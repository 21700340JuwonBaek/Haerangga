import 'package:flutter/material.dart';
import 'package:haerangga/logic/mysql.dart';
import 'package:haerangga/second.dart';

class FieldScreen extends StatefulWidget{

  FieldScreen({required this.nlist, required this.flist});
  final List<String> nlist;
  final List<String> flist;
  @override
  _FieldScreen createState() => _FieldScreen(nlist: nlist, flist:flist);

}


class _FieldScreen extends State<FieldScreen> {
  _FieldScreen({required this.nlist, required this.flist});
  final List<String> nlist;
  final List<String> flist;
  List<String> newfield=[];
  @override
  void initState() {

    for(int i =0; i<flist.length;i++){
      print('hello');
      print(flist[i]);
      if(flist[i] == 'embassy_and_consulate'){
        newfield.add('Embassy');
      }else if(flist[i] == 'literacy_rate'){
          newfield.add('Literacy');
      }else if(flist[i] == 'nation'){
        newfield.add('Nation');
      }else if(flist[i] == 'water'){
        newfield.add('Water');
      }else if(flist[i] == 'city'){
        newfield.add('City');
      }else if(flist[i] == 'currency'){
        newfield.add('Currency');
      }else if(flist[i] == 'language'){
        newfield.add('Language');
      }else if(flist[i] == 'climate'){
        newfield.add('Climate');
      }
    }


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Field",
            style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,color:Colors.white )),
          backgroundColor: Colors.deepOrangeAccent,
          iconTheme: IconThemeData(color:Colors.white),
    ),body:ListView.builder(
        padding:const EdgeInsets.all(8.0),
        itemCount:flist.length,
        itemBuilder: (BuildContext context, int index){
          return new ListTile(
            title : Text(newfield[index],
              style:TextStyle(fontSize:25, )),
            trailing: Icon(Icons.navigate_next),

            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>SecondScreen(nlist : nlist, fieldname: flist[index],)),

              );
            },
          );
        }
    )

    );
  }

}