import 'package:flutter/material.dart';

import '../DOrganizationExplain.dart';

class DOrganizationTile extends StatelessWidget {
  final String name;
  final String city;
  final String location;
  final String contact;
  final String url;
  final String nation;

  DOrganizationTile(
      this.name, this.city, this.location, this.contact, this.url, this.nation);

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
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DOrganizationExplain(
                      name, city, location, contact, url, nation)));
        },
      ),
    );
  }
}