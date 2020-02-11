import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventsList extends StatelessWidget{
  final String title;
  final String keyValue;

  EventsList({this.keyValue, this.title});
  @override
  Widget build(BuildContext context){
    return Container(
      key: Key(keyValue),
      margin: EdgeInsets.only(bottom: 5),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          new BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Radio(

          ),
          Column(
            children: <Widget>[
              Text(title)
            ],
          )
        ],
      ),
    );
  }
}