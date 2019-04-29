import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget showAppName() {
    return Text(
      'Champion Flutter นะจ้ะ',
      style: TextStyle(
          fontFamily: 'Kanit',
          fontSize: 24.0,
          fontWeight: FontWeight.normal,
          color: Colors.white),
    );
  }

  Widget showLogo() {
    return Image.asset('assets/images/logo.png');
  }

  @override
  Widget build(BuildContext context) {
    // return Text('StatfulWidget');
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.teal[900], Colors.teal[400]], begin: Alignment(-1.0, -1.0))),
          padding: EdgeInsets.only(top: 100.0),
          alignment: Alignment(0, -1),
          child: Column(
            children: <Widget>[
              Container(
                width: 128.0,
                height: 128.0,
                child: showLogo(),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: showAppName(),
              )
            ],
          )),
    );
  }
}
