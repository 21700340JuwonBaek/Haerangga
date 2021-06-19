import 'package:flutter/material.dart';
import 'package:haerangga/logic/mysql.dart';
import 'package:haerangga/field.dart';

class SecondScreen extends StatefulWidget{
  SecondScreen({required this.nlist, required this.fieldname});
  final List<String> nlist;
  final String fieldname;
  @override
  _SecondScreen createState() => _SecondScreen(nlist: nlist, fieldname:fieldname);

}


class _SecondScreen extends State<SecondScreen> {
  _SecondScreen({required this.nlist, required this.fieldname});
  final List<String> nlist;
  final String fieldname;
  List<String> items=[];
  var db = new Mysql();
  var id_number='0';
  String query='';
  String field = '';
  List<String> line =[];
  bool dataReady = false;
  List<String> nation_List = ['네팔','동티모르','라오스','몽골','미얀마','방글라데시','베트남','스리랑카','인도네시아','캄보디아','태국','파키스탄','필리핀','부탄'];


  @override
  void initState() {

    var or='';
    void _getNation(id_number,field){
      db.getConnection().then((conn) {
        String sql =
            'SELECT * FROM haerang_ga.$field WHERE $id_number';
        String temp ='';
        conn.query(sql).then((results) {
          for(var row in results){
            temp = "";
            if(field == 'embassy_and_consulate'){
              temp = temp+
                  "Nation : "+nation_List[row['nation_id']-1]+'\n'+
                  "Embassy : " +row['name']+'\n'+
                  "Phone : " +row['phone']+'\n'+
                  "Address : " +row['address'];
            }else if(field == 'literacy_rate'){
              temp = temp+
                  "Nation : "+nation_List[row['nation_id']-1]+'\n'+
                  "Literacy Rank: " +row['rank'].toString();
            }else if(field == 'city'){
              temp = temp+
                  "Nation : "+nation_List[row['nation_id']-1]+'\n'+
                  "City : "+row['city_name_kor']+ "("+row['city_name_eng']+")"+'\n'+
                  "Population : "+row['population'].toString();
            }else if(field == 'currency'){
              temp = temp+
                  "Nation : "+nation_List[row['nation_id']-1]+'\n'+
                  "Currency Name : "+row['currency_name'].toString()+'\n'+
                  "Exchange Rate(Won) : "+row['exchange_rate_won'].toString()+'\n'+
                  "Exchange Rate(Dollar) : "+row['exchange_rate_dollar'].toString();
            }else if(field == 'nation'){
              temp = temp+
                  "Nation : "+nation_List[row['nation_id']-1]+" ("+row['nation_name_eng']+")\n"+
                  "Nation Code : "+row['nation_code'].toString()+'\n'+
                  "Latitude : "+row['latitude'].toString()+'\n'+
                  "Longitude : "+row['longitude'].toString();
            }else if(field == 'climate'){
              temp = temp+
                  "Nation : "+nation_List[row['nation_id']-1]+'\n'+
                  "High Temp : "+row['temp_high'].toString()+'°C\n'+
                  "Low Temp : "+row['temp_low'].toString()+'°C';
            }else if(field == 'water'){
              temp = temp+
                  "Nation : "+nation_List[row['nation_id']-1]+'\n'+
                  "Physical Water Stress Level : "+row['physical_water_stress_level'].toString()+'\n'+
                  "Annual Fresh Water per Person : "+row['annual_Fresh_Water_per_person'].toString()+'\n'+
                  "Water Poverty: "+row['water_poverty'].toString();
            }else if(field == 'language'){
              temp = temp+
                  "Nation : "+nation_List[row['nation_id']-1]+'\n'+
                  "Language Code : "+row['language_code'].toString()+'\n'+
                  "Language Name : "+row['language_name'].toString();
            }

            setState(() {
              line.add(temp);
            });
          }
        });
      });

    }

    for(int i =0; i<nlist.length;i++){
      if(i>0){
        id_number = nlist[i];
        or+='OR ';
        or+= 'nation_id = $id_number ';
      }else if(i==0){
        id_number = nlist[i];
        or += 'nation_id = $id_number ';
      }
    }
    print(or);
    _getNation(or,fieldname);

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Result",
              style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,color:Colors.white )),
          backgroundColor: Colors.deepOrangeAccent,
          iconTheme: IconThemeData(color:Colors.white),

        ),
        body:ListView.separated(
            padding:const EdgeInsets.all(16.0),
            itemCount:line.length,
            itemBuilder: (BuildContext context, int index){
                return Container(
                  child: ListTile(
                    title: Text(line[index],style: TextStyle(fontSize: 18),),
                    onTap: () {
                      print(line[index]);
                    },
                  ),
                );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
        )
    );

    //print(line);

  }

}
