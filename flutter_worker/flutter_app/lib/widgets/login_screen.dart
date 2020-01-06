import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/presenter/login.dart';
import 'package:flutter_app/widgets/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final myEmail = TextEditingController();
  final myPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    myEmail.dispose();
    myPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
          title: Text('Login Gofix App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              TextField(
                controller: myEmail,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                    hintText: 'Email'),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextField(
                controller: myPassword,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    hintText: 'Password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              ButtonTheme(
                padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  textColor: Colors.white,
                  color: Colors.blueGrey,
                  onPressed: () {
                    postLoginRequest().then((value) {
                      if (value.statusCode == 200) {
                        getUserProfile().then((response) {
                          if (response.statusCode == 200) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                        });
                      }
                    });
                  },
                  child: Container(
                    child: Text('Login with Email'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
