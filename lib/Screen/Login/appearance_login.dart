import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Screen/Login/widget_column_login.dart';
import 'package:kepuharjo_app/Screen/Login/widget_pict_logo.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class AppeareaceLogin extends StatefulWidget {
  const AppeareaceLogin({Key key}) : super(key: key);

  @override
  State<AppeareaceLogin> createState() => _AppeareaceLoginState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class _AppeareaceLoginState extends State<AppeareaceLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                WidgetPicture(),
                WidgetLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
