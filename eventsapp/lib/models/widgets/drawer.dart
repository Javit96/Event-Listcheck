import 'package:eventsapp/bloc/blocs/user_bloc_provider.dart';
import 'package:eventsapp/bloc/resources/api.dart';
import 'package:eventsapp/models/classes/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerMenu extends StatefulWidget {
  final VoidCallback logout;
  final String apiKey;
  
  

  const DrawerMenu({Key key, this.logout, this.apiKey})
      : super(key: key);
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerMenu> {
  String username = "";
  User userInfo;
  

  

   @override
  void dispose()
  {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    username = userInfo.username;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(username),
            accountEmail: Text("ashishrawat2911@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            title: Text('Log Out'),
            leading: Icon(Icons.directions_walk),
            onTap: () {
              widget.logout();
            },
          ),
        ],
      ),
    );
  }
}
