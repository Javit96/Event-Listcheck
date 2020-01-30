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
  TextEditingController firstController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Wigdet build(BuildContext context)
  {
    return Scaffold
    (
      body: Center(
          child: widget.newUser ? getSignupPage() : getSigninPage(),
        ),
      );
    
  }

  Widget getSigninPage()
  {
      TextEditingController usernameController = new TextEditingController();
      TextEditingController passwordController = new TextEditingController();
    return Container
    (
      gradient: LinearGradient
      (
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.green, Colors.greenAccent],
      ),
    );
  }

}


