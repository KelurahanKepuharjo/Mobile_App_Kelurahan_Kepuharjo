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
    return DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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
                  WidgetPictureReg(),
                  WidgetRegister(),
                ],
              ),
            ),
          ),
        ));
  }
}
