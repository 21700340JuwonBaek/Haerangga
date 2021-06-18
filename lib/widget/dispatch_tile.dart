import 'package:flutter/material.dart';
import 'package:haerangga/dispatch_explain.dart';

class dispatchTile extends StatelessWidget {
  final String nation;
  final int nation_id;

  dispatchTile(this.nation_id, this.nation);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                nation,
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        //   subtitle: Text('Join the ' + groupName + ' as ' + userName,
        // style: TextStyle(fontSize: 13.0)),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => dispatch_explain(
                        nation_id: nation_id,
                        nation: nation,
                      )));
        },
      ),
    );
  }
}
