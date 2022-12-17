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
    return Column(children: [
      TextFormField(
        textInputAction: textInputAction,
        obscureText: isObscureText,
        controller: controller,
        style: poppinsSmallBlack.copyWith(fontSize: 13),
        keyboardType: keyboardType,
        enabled: isEnable,
        onSaved: (val) => controller = val as TextEditingController,
        validator: (value) {
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
          labelText: hintName,
          labelStyle: GoogleFonts.poppins(fontSize: 12),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(width: 1, color: appColor)),
          filled: false,
          fillColor: const Color.fromARGB(179, 234, 234, 234),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: appColor),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    ]);
  }
}
