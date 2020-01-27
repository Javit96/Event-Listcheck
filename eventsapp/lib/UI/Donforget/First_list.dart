import 'package:flutter/material.dart';

class FirstList extends StatefulWidget
{
  @override

  _FirstListState createState() => _FirstListState();

}

class _FirstListState extends State<FirstList>
{
  @override

  Widget build(BuildContext context)
  {
    return Container
    (
      
      child: ListView
      (
        padding: EdgeInsets.only(top: 300),
        children: getList(),
      ),
    );
  }


  List<Widget> getList()
    {
      return[
        Container(
                  height: 100,
                  color: Colors.blue, 
                  ),
                 Container(
                  height: 100,
                  color: Colors.yellow, 
                  ),Container(
                  height: 100,
                  color: Colors.green, 
                  ),Container(
                  height: 100,
                  color: Colors.red, 
                  ),
      ];
    }

}