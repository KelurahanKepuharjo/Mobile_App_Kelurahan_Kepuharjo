import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Screen/Register/widget_column_reg.dart';
import 'package:kepuharjo_app/Screen/Register/widget_pict_reg.dart';

class AppearanceRegister extends StatefulWidget {
  const AppearanceRegister({Key? key}) : super(key: key);

  @override
  State<AppearanceRegister> createState() => _AppearanceRegisterState();
}

class _AppearanceRegisterState extends State<AppearanceRegister> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
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
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key: _formkey,
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
          ),
        ));
  }
}
