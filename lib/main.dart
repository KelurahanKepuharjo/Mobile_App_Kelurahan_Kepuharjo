import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kepuharjo_app/Model/RememberUser.dart';
import 'package:kepuharjo_app/Screen/Login/appearance_login.dart';
import 'package:kepuharjo_app/Screen/NavButton/Home_Screen.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
      home: FutureBuilder(
          future: RememberUser.readUser(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const AppeareaceLogin();
            } else {
              return const HomeScreen();
            }
          }),
    );
  }
}
