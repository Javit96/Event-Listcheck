import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eventsapp/models/global.dart';
import 'package:auto_size_text/auto_size_text.dart';

class EventsList extends StatelessWidget {
  final String title;
  final String keyValue;

  EventsList({this.keyValue, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.greenAccent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.album),
              title: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Acumin',
                  fontWeight: FontWeight.bold,
                  color: darkLight,
                  fontSize: 40,
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
