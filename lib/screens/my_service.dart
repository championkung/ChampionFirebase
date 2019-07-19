import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';




class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {

  //Initial Method
  @override
  void initState() {
  // TODO: implement initState
    super.initState();
    readData(context);
  }

  void readData(BuildContext context) async{
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    String currentUid = firebaseUser.uid.toString();
    var objData = await firebaseDatabase.reference().child(currentUid);
    print('objData ==> $objData');
    // String nameString = objData.
  }

  //For Firebase
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //FirbaseDatabase
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;



  Widget signOutButton() {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        print('You Click SignOut');
        signOutProcess();
      },
    );
  }

void signOutProcess() async{
  // await firebaseAuth.signOut();
  await FirebaseAuth.instance.signOut();
  exit(0);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyService'), actions: <Widget>[signOutButton()],),
      body: Text('This is Body'),
    );
  }
}
