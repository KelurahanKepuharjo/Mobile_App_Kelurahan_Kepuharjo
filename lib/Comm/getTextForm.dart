import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class getTextForm extends StatelessWidget {
  TextEditingController controller;
  String hintName;
  bool isObscureText;
  bool isEnable;
  bool isReadOnly;
  TextInputType keyboardType;
  TextInputFormatter inputFormatters;
  int length;
  TextInputAction textInputAction;

  getTextForm(
      {Key key,
      this.controller,
      this.hintName,
      this.isObscureText = false,
      this.keyboardType,
      this.inputFormatters,
      this.length,
      this.isReadOnly = false,
      this.isEnable = true,
      this.textInputAction = TextInputAction.done})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          TextFormField(
            textInputAction: textInputAction,
            obscureText: isObscureText,
            controller: controller,
            style: poppinsMediumBlack,
            keyboardType: keyboardType,
            enabled: isEnable,
            onSaved: (val) => controller = val as TextEditingController,
            validator: (String value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $hintName';
              }
              return null;
            },
            inputFormatters: [
              inputFormatters,
              LengthLimitingTextInputFormatter(length)
            ],
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Color.fromARGB(179, 234, 234, 234),
                hintText: hintName,
                hintStyle: GoogleFonts.poppins(fontSize: 12)),
          ),
        ]));
  }
}
