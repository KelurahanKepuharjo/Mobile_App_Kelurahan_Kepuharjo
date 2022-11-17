import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Pages/pages.dart';

import 'package:kepuharjo_app/Shared/shared.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      theme: ThemeData(
          primaryColor: greenColor,
          primarySwatch: Colors.green,
          canvasColor: Color(0xFF000000)),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
