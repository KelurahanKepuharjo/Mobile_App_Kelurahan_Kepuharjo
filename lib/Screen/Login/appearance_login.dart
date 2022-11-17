import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Screen/Login/widget_column_login.dart';
import 'package:kepuharjo_app/Screen/Login/widget_pict_logo.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class AppeareaceLogin extends StatefulWidget {
  const AppeareaceLogin({key});

  @override
  State<AppeareaceLogin> createState() => _AppeareaceLoginState();
}

class _AppeareaceLoginState extends State<AppeareaceLogin> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [lightGreen, midGreen, darkgreenColor],
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  WidgetPicture(),
                  WidgetLogin(),
                ],
              ),
            ),
          ),
        ));
  }
}
