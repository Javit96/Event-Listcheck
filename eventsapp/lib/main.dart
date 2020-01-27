import 'package:flutter/material.dart';
import 'package:eventsapp/UI/Donforget/First_list.dart';
//import 'package:eventsapp/models/global.dart';

void main() =>  runApp(Myapp());

class Myapp extends StatelessWidget{

 @override
 Widget build(BuildContext context)
 {
  return MaterialApp
  (
    title: 'No te Olvides',
      theme: ThemeData(primarySwatch: Colors.yellow),
      
      home: MyHomePage(title: 'No te olvides'),
    );
  
 }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context)
  {
     return MaterialApp(
        
        home: SafeArea
        (
           child: new Scaffold
            (
              body: Stack(
                children: <Widget>[ 
              Container(
                  padding: EdgeInsets.only(left: 50),
                  height: 250,
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)
                      ),
                  color: Colors.greenAccent, 
                  ),
                 ),
               
                Container
                  (
                    child:  FirstList(),
                  ),

                Container
                (
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(top: 550, left:300),
                  child: FloatingActionButton
                  (
                    child: Icon(Icons.add, size: 35,),
                    backgroundColor: Colors.green,
                    onPressed: (){},
                  ),
                )
                
                ],
                
              ),
              
              drawer: Drawer
                (
                  child: ListView
                  (
                    padding: EdgeInsets.zero,
                    children: <Widget>
                    [
                     Container(
                        height: 75,
                        
                      child:  DrawerHeader
                      (
                        
                        child: Text('No te Olvides'),
                        decoration: BoxDecoration
                          (
                            color: Colors.green,
                          ),
                      ),
                      ),
                    ListTile
                    (
                      title: Text('Item 1'),
                      onTap: () 
                      {
                           
                      },
                      
                    ),
                    ],
                  ),
              ),
              
             
              
            ),
        ),
     );
    }
  }

