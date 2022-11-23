import 'package:flutter/material.dart';

import 'package:kepuharjo_app/Screen/Splash/pages.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Colors.transparent),
          primaryColor: blueColor,
          primarySwatch: Colors.blue,
          canvasColor: const Color(0xFF000000)),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
