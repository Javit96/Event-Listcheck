import 'package:flutter/material.dart';
import 'package:eventsapp/bloc/blocs/user_bloc_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eventsapp/models/classes/user.dart';


class LoginPage extends StatefulWidget {
  final VoidCallback login;
  final bool newUser;

  const LoginPage({Key key, this.login, this.newUser})
      :super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  

  TextEditingController emailController = new TextEditingController();  
  TextEditingController usernameController = new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
         body: Container(
           decoration:  BoxDecoration
           (
              gradient: LinearGradient
              (
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.green, Colors.greenAccent],
              ),
            ),
             
          child: widget.newUser ? getSignupPage() : getSigninPage(),
        ),
      );
    
  }

  Widget getSigninPage()
  {
    TextEditingController usernameText = new TextEditingController();
    TextEditingController passwordText = new TextEditingController();
    
      
    return Container(
      
      margin: EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Welcome!"),
          Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Theme(
                  data: Theme.of(context)
                      .copyWith(splashColor: Colors.transparent),
                  child: TextField(
                    controller: usernameText,
                    autofocus: false,
                    style: TextStyle(fontSize: 22.0),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Username',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),
                Theme(
                  data: Theme.of(context)
                      .copyWith(splashColor: Colors.transparent),
                  child: TextField(
                    controller: passwordText,
                    autofocus: false,
                    
                    style: TextStyle(fontSize: 22.0),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  child: Text("Sign in",),
                  onPressed: () {
                    if (usernameText.text != null || passwordText.text != null) {
                      userBloc.singinUser(usernameText.text, passwordText.text, "").then((_){
                        widget.login();
                        
                      });
                    }
                  },
                )
              ],
            ),
          ),
          Container(
            child: 
            Column(
              children: <Widget>[
                Text("Don't you even have an account yet?!", textAlign: TextAlign.center,),
                FlatButton(
                  child: Text("create one"),
                  onPressed: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => getSignupPage()),
                                  ),
                )
              ],
            ), 
          )
        ],
      ),
    );
  }
      
  Widget getSignupPage() {
    return Container(
      
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(hintText: "Email"),
          ),
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(hintText: "Username"),
          ),
          TextFormField(
            controller: firstNameController,
            decoration: InputDecoration(hintText: "First name"),
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(hintText: "Password"),
          ),
          FlatButton(
            color: Colors.green,
            child: Text("Sign up"),
            onPressed: () {
              if (usernameController.text != null ||
                  passwordController.text != null ||
                  emailController.text != null) {
                userBloc
                    .registerUser(
                        usernameController.text,
                        firstNameController.text ?? "",
                        "",
                        passwordController.text,
                        emailController.text)
                    .then((_) {
                  widget.login();
                });
              }
            },
          )
        ],
      ),
    );
  }
}
  



