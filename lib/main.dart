import 'package:flutter/material.dart';
import 'package:flutter_web/SignUp.dart';
import 'package:flutter_web/authservice.dart';
import 'package:flutter_web/homepage.dart';
import 'package:provider/provider.dart';
import 'User.dart';
import 'LoginPage.dart';
import 'Wrapper.dart';

void main()
{
  runApp(Myapp(),
  );
}
class Myapp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamProvider<User>.value(value: Authservice().user,
     child: MaterialApp(
      home:Wrapper(),
    )
    );
      }

  }




