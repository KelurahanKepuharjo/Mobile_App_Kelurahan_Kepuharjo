import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Screen/Register/widget_column_reg.dart';
import 'package:kepuharjo_app/Screen/Register/widget_pict_reg.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class AppearanceRegister extends StatefulWidget {
  const AppearanceRegister({Key key}) : super(key: key);

  @override
  State<AppearanceRegister> createState() => _AppearanceRegisterState();
}

class _AppearanceRegisterState extends State<AppearanceRegister> {
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
                children: const [
                  WidgetPictureReg(),
                  WidgetRegister(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
