import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_web/authservice.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final Authservice _auth=new Authservice();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text('You are now logged in'),
                    SizedBox(
                      height: 15.0,
                    ),
                    new OutlineButton(
                      borderSide: BorderSide(
                          color: Colors.red,
                          style: BorderStyle.solid,
                          width: 3.0),
                      child: Text('Logout'),
                      onPressed: () async{
                        dynamic result=await _auth.SignOut();


                      },
                    )
                  ]
              )
          )
      ),);
  }
}