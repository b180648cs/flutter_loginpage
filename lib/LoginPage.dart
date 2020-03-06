

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/LoadingPage.dart';
import 'package:flutter_web/authservice.dart';
import 'package:provider/provider.dart';
import 'SignUp.dart';
import 'homepage.dart';
import 'User.dart';

class LoginPage extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }

}
class LoginPageState extends State<LoginPage>
{String _email;
String _password;
String error='';
final _formkey=GlobalKey<FormState>();
final Authservice _auth =new Authservice();
bool loading=false;

   TextEditingController textEditingController=new TextEditingController();
   TextEditingController text=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return loading?Loading():Form(
    key: _formkey,
    child:Container(
      decoration: BoxDecoration(
      ),
      child: Scaffold(
      backgroundColor: Colors.white ,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25.0,top: 150.0,right: 30.0),
              child: Text(
                "HELLO THERE",style: TextStyle(color: Colors.black.withOpacity(0.9),fontSize: 35.0,fontWeight: FontWeight.bold),
              ),

            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0,top: 15.0,bottom: 30.0),
              child:Text("LOGIN PAGE",style: TextStyle(fontSize: 30.0,color: Colors.black.withOpacity(0.9),fontWeight: FontWeight.bold),)
            ),
            Form(

            child:TextFormField(
              validator: (val)=>val.isEmpty?"Enter a emai":null,
              controller: textEditingController,
              decoration: InputDecoration(
                labelText: "Email",
                focusColor: Colors.amber,
                hintText: "jhaaditya52@yahoo.com",
                labelStyle: TextStyle(
                  color: Colors.black.withOpacity(0.9),
                  fontSize: 20.0
                ),
                hintStyle: TextStyle(
                  color: Colors.black
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),

              ),
              onChanged: (value)
              {
                setState(() {
                  _email=value;
                  print(_email);
                });
              },
            ),
            ),
            Form(
              child:TextFormField(
                validator: (val)=>val.length<6?'Enter password 6 charcters long':null,
              controller: text,
              decoration: InputDecoration(
                focusColor: Colors.amber,
                labelText: "Password",
                hintText: "123@assan",
                labelStyle: TextStyle(
                  color: Colors.black.withOpacity(0.9),
                  fontSize: 20.0
                ),
                hintStyle: TextStyle(
                  color: Colors.black
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),

              ),
              onChanged: (value)
              {
                setState(() {
                  _password=value;
                  print(_password);
                });
              },
            ),
            ),
            Padding(
              padding: EdgeInsets.only(top:10.0),
            ),
            Container(
              child:Padding(

              padding: EdgeInsets.only(right:15.0,left:220.0),
              child: InkWell(
                onTap: ()
                {

                },
               child: Text(
                 "Forgot password",
                 style: TextStyle(
                   color: Colors.greenAccent,
                   fontSize: 20.0,
                   fontWeight: FontWeight.bold,
                 ),
               ),
              ),
            )
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding:EdgeInsets.only(left: 15.0,right: 15.0),
            child:Container(
              height: 30.0,
              child:Material(
              color: Colors.greenAccent,
               elevation: 7.0,
              shadowColor: Colors.green,
              borderRadius: BorderRadius.circular(40.0),
              child: GestureDetector(
                child: Center(child:Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white,fontSize: 17.0),
                ),
              ),
                onTap: () async
                {
                  if (_formkey.currentState.validate()) {
                    setState(() {
                      loading=true;
                    });
                    dynamic result=await _auth.Signwithemailandpassword(_email, _password);
                    if(result==null) {
                      setState(() {
                        print("hurrah");
                        loading = false;
                        error == 'supply valid email id';
                      });
                    }
                    else
                      {
                        print("Damn ");
                      }
                  }

                },
            ),
              ),
            ),
    ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0,right: 15.0),
            child:Container(
              height: 30.0,
              child:Material(
                color: Colors.white,
                elevation: 7.0,
                shadowColor: Colors.white,
                borderRadius: BorderRadius.circular(40.0),

                child: GestureDetector(
                  child: Center(

                  child:Text(
                    "LOGIN THROUGH FACEBOOK",
                    style: TextStyle(color: Colors.black,fontSize: 17.0),
                  ),
                ),
                  onTap: ()
                  {
                  Navigator.of(context).pushReplacementNamed('/HomePage');
                  },
                ),
              ),
            ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Center(
              child:  Text("NEW TO THIS APP",style: TextStyle(color: Colors.black,fontSize: 17.0),),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 100.0,right: 100.0),
            child:Container(
              width: 50.0,
              height: 50.0,
              child: Center(

                child: FlatButton(
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>SignPage()));
                  },
                  color: Colors.greenAccent,
                  child: Center(
                    child: Text(
                      "REGISTER",style: TextStyle(color: Colors.white,fontSize: 17.0),
                    ),
                  ),
                ),
              ),
            )
            ),


          ],
        ),
      ),
    )
    );
  }

}