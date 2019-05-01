import 'package:flutter/material.dart';
import 'package:championfirebase/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:championfirebase/screens/my_service.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  TextStyle myLabelStyle = TextStyle(fontSize: 18.0, color: Colors.white);
  TextStyle myHintStyle = TextStyle(color: Colors.white30);

  // For Form
  final formKey = GlobalKey<FormState>();

  //For SnackBar
  final snackBarKey = GlobalKey<ScaffoldState>();

  //  Constant
  String titleHaveSpace = 'กรุณากรอก ข้อมูลให้ครบ';
  String titleEmailFalse = 'กรุณากรอก รูปแบบ email ให้ถูกต้อง';
  String titlePasswordFalse = 'กรุณากรอก password มากกว่า 6 ตัวอักษร';

  String emailString, passwordString;

//For Firebase
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void checkAuthen(BuildContext context) async {
    FirebaseUser firebaseUser = await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((objValue) {
      showSnackBar(objValue.email);
      //ROUTE Without Arrow Back
      var myServiceRoute =
          MaterialPageRoute(builder: (BuildContext context) => MyService());
          Navigator.of(context).pushAndRemoveUntil(myServiceRoute, (Route<dynamic> route) => false);

    }).catchError((objValue) {
      String error = objValue.message;
      print('ERROR ==> $error');
      showSnackBar(error);
    });
  }

  void showSnackBar(String messageString) {
    SnackBar snackbar = SnackBar(
      backgroundColor: Colors.red,
      duration: Duration(seconds: 10),
      content: Text(messageString),
      action: SnackBarAction(
          label: 'Close',
          onPressed: () {} //click แล้ว จะปิด SnackBar ไปเอง ไม่ต้องใส่ค่าอะไร,
          ),
    );
    snackBarKey.currentState.showSnackBar(snackbar);
  }

  Widget signInButton(BuildContext context) {
    return RaisedButton.icon(
      color: Colors.orange[600],
      label: Text('Sign In'),
      icon: Icon(Icons.account_circle),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      onPressed: () {
        print('You Click SignIn Button');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('email ==>> $emailString');
          print('password ==>> $passwordString');
          checkAuthen(context);
        }
      },
    );
  }

  FormFieldState formFieldState() => FormFieldState();
  Widget signUpButton() {
    return RaisedButton(
      color: Colors.orange[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Text('Sign Up'),
      onPressed: () {
        print('Clicking Sign Up');
        var registerRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);
      },
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
      validator: (String value) {
        if (value.length == 0) {
          return titleHaveSpace;
        } else if (!((value.contains('@')) & (value.contains('.')))) {
          return titleEmailFalse;
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
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
      validator: (String value) {
        if (value.length < 6) {
          return titlePasswordFalse;
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
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
        key: snackBarKey,
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: formKey,
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue[400], Colors.blue[700]],
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
                            child: signInButton(context),
                          )),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(left: 5),
                            child: signUpButton(),
                          )),
                        ],
                      ))
                ],
              )),
        ));
  }
}
