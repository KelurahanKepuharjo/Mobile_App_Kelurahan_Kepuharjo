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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 35, 35, 95),
            appColor,
            Color.fromARGB(255, 51, 51, 148),
          ],
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const WidgetPicture(),
                  const WidgetLogin(),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "@S-Kepuharjo",
                        style: poppinsSmallBlack.copyWith(
                            color: whiteColor.withOpacity(0.5)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
