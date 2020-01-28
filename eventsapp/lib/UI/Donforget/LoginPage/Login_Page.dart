import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page Flutter Firebase"),
      ),
      body: Container(
      padding: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
        children: <Widget>[
        SizedBox(height: 20.0),
        Text(
          'Login Information',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20.0),
        TextFormField(
            onSaved: (value) => _email = value,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: "Email Address")),
        SizedBox(height: 20.0),
        TextFormField(
            onSaved: (value) => _password = value,
            obscureText: true,
            decoration: InputDecoration(labelText: "Password")),
        RaisedButton(
          child: Text("LOGIN"), 
          onPressed: () 
          {
            final form = _formKey.currentState;
            form.save();
            if (form.validate()) {
                print("$_email $_password");
                  }
          }),
      ],
      ),
      ),
      
    ),
    );
  }
}

