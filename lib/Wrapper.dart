import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web/LoginPage.dart';
import 'package:flutter_web/homepage.dart';
import 'package:provider/provider.dart';

import 'User.dart';

class Wrapper extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final user=Provider.of<User>(context);

    if(user==null)
      { print("Aditya");
        return LoginPage();
      }
    else
      {print("jha");
        return DashboardPage();
      }
  }

}