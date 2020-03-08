import 'package:eventsapp/bloc/resources/api.dart';
import 'package:flutter/material.dart';


class DrawerMenu extends StatefulWidget
{
  
 
  @override
  _DrawerState createState() => _DrawerState();

}

 class _DrawerState extends State<DrawerMenu>
{

  Widget build(BuildContext context)
  {
            Drawer
                (
                  child: ListView
                  (
                    padding: EdgeInsets.zero,
                    children: <Widget>
                    [
                      UserAccountsDrawerHeader(
                        
                                accountName: Text(""),
                                accountEmail: Text("ashishrawat2911@gmail.com"),
                                currentAccountPicture: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Text(
                                    "A",
                                    style: TextStyle(fontSize: 40.0),
                                  ),
                                ),
                              ),
                     
                      
                       ListTile
                      (
                          title: Text('Log Out'),
                          leading: Icon(Icons.directions_walk),
                          onTap: () 
                              {
                               //widget.logout();
                              },
                      ),
                      ],
                  ),
              ) ;
}
}