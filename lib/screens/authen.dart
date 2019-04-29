import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  TextStyle myLabelStyle = TextStyle(fontSize: 18.0, color: Colors.white);
  TextStyle myHintStyle = TextStyle(color: Colors.white30);

  Widget signInButton() {
    return RaisedButton(
      color: Colors.orange[600],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Text('Sign In'),
      onPressed: () {

      },
    );
  }

  Widget signUpButton() {
    return RaisedButton(
      color: Colors.orange[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Text('Sign Up'),
      onPressed: () {},
    );
  }

  Widget emailTextFormField() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          labelText: 'Email: ',
          hintText: 'youremail.com',
          hintStyle: myHintStyle,
          labelStyle: myLabelStyle),
    );
  }

  Widget passwordTextFormField() {
    return TextFormField(
      obscureText: true,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          labelText: 'Password: ',
          hintText: 'your password',
          hintStyle: myHintStyle,
          labelStyle: myLabelStyle),
    );
  }

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
      resizeToAvoidBottomPadding: false,
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.teal[400], Colors.teal[600]],
                  begin: Alignment(-1.0, -1.0))),
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
              ),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50),
                child: emailTextFormField(),
              ),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50),
                child: passwordTextFormField(),
              ),
              Container(
                  margin: EdgeInsets.only(left: 50, right: 50, top: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 5),
                          child: signInButton(),
                        )
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 5),
                          child: signUpButton(),
                        )
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
