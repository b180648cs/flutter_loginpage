
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'User.dart';

class Authservice
{
  User _userFromFirebase(FirebaseUser user)
  {
    return user!=null?User(uid:user.uid):null;
  }
  Stream<User> get user
  {
    return auth.onAuthStateChanged

            .map(_userFromFirebase);
  }

  final FirebaseAuth auth=FirebaseAuth.instance;
  Future signinanon() async
  {
    try{
    AuthResult result =await auth.signInAnonymously();
    FirebaseUser user=result.user;
    return _userFromFirebase(user);


  }catch(e)
    {
      print(e.toString());
      return null;
    }

}
Future SignOut() async
{
  try{
    return await auth.signOut();
  }
  catch(e){
    print(e.toString());
    return Null;
  }
}
Future registerwithemailandpassword(String email,String password)async
  {
    try{
      AuthResult result=await auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;
      return _userFromFirebase(user);

    }
    catch(e)
    { print(e.toString());
    return null;

    }

  }
  Future Signwithemailandpassword(String email,String password)async
  {
    try{
      AuthResult result=await auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;
      return _userFromFirebase(user);

    }
    catch(e)
    { print(e.toString());
    return null;

    }

  }

}