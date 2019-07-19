import 'package:flutter/material.dart';
import 'package:championfirebase/screens/authen.dart';
import 'package:championfirebase/screens/maps.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Champion Firebase',
      // home: MyMapApp(), 
      home: Authen(), 
    );
  }
}
