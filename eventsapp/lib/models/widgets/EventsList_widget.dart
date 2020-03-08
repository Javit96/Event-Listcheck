import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventsList extends StatelessWidget {
  final String title;
  final String keyValue;

  EventsList({this.keyValue, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Card(
        color: Colors.greenAccent,
        elevation: 5,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.album),
              title: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Acumin Pro',
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF312C2C),
                  fontSize: 30,
                ),
              ),
              subtitle: Text('Description.'),
            ),
          ],
        ),
      ),
    );
  }
}
