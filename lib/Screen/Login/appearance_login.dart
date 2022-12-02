import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Screen/Login/widget_column_login.dart';
import 'package:kepuharjo_app/Screen/Login/widget_pict_logo.dart';

class AppeareaceLogin extends StatefulWidget {
  const AppeareaceLogin({key});

  @override
  State<AppeareaceLogin> createState() => _AppeareaceLoginState();
}

// final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class _AppeareaceLoginState extends State<AppeareaceLogin> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0XFF00ECBC),
            Color(0xFF007ADF),
            Color(0xFF2A2A72),
          ],
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
