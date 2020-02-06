import 'package:eventsapp/bloc/blocs/user_bloc_provider.dart';
import 'package:eventsapp/models/authentication/authorize.dart';
import 'package:flutter/material.dart';
import 'package:eventsapp/UI/Donforget/First_list.dart';
//import 'package:eventsapp/models/global.dart';
import 'UI/Donforget/LoginPage/Login_Page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'bloc/blocs/user_bloc_provider.dart';

void main() => runApp(Myapp());


class Myapp extends StatelessWidget{

 @override
 Widget build(BuildContext context)
 {
  return MaterialApp
  (
    debugShowCheckedModeBanner: false,
    title: 'No te Olvides',
      theme: ThemeData(primarySwatch: Colors.green),
      
      home: MyHomePage()
  );
  
 }
}

class MyHomePage extends StatefulWidget {
  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String apiKey;

  @override
  Widget build(BuildContext context)
  {
     return FutureBuilder(
       future: signinUser(),
       builder: (BuildContext context, AsyncSnapshot snapshot)
       {
         if (snapshot.hasData)
         {
           apiKey = snapshot.data;
           print(apiKey);
         }
         else
         {
           print("No Data");
         }

        return apiKey.length > 0 ? getHomePage() : LoginPage(login : login, newUser :false,);
        },
     );
  }

  void login()
  {
    setState(() {
      build(context);
    });
  }

  Future signinUser() async
  {
    String userName = "";
    apiKey = await getApiKey();
    if (apiKey.length > 0)
    {
      UserBloc.singinUser("","", apiKey);
    }
    else
    {
      print("No apikey");
    }
  }

  Future getApiKey() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString("Api_Token");//key
  }
        
  Widget getHomePage(){
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
                    child:  FirstList(apiKey: apiKey,),
                  ),

                Container
                (
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only
                  (
                    top: 550, 
                    left:MediaQuery.of(context).size.width * 0.5 - 40
                  ),
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
                          title: Text('Log Out'),
                          leading: Icon(Icons.directions_walk),
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

  logout() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("Api_Token", "value");//key and value
    setState(() {
      build(context);
    });
  }

  @override
  void initState()
  {
    super.initState();
  }

}

