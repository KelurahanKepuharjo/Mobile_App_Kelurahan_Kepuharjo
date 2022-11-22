import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api_Connection/api_connection.dart';
import 'package:kepuharjo_app/Comm/getTextField.dart';
import 'package:kepuharjo_app/Model/User_Model.dart';
import 'package:kepuharjo_app/Screen/Login/appearance_login.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetRegister extends StatefulWidget {
  const WidgetRegister({Key key}) : super(key: key);

  @override
  State<WidgetRegister> createState() => _WidgetRegisterState();
}

bool _isChecked = false;

final nikController = TextEditingController();
final passwordController = TextEditingController();
final namaController = TextEditingController();
final tlpController = TextEditingController();

registerUserRecord() async {
  UserModel userModel = UserModel(
    nikController.hashCode,
    namaController.toString(),
    tlpController.toString(),
    passwordController.toString(),
  );

  try {
    var res = await http.post(
      Uri.parse(Api.register),
      body: userModel.toJson(),
    );
    if (res.statusCode == 200) {
      var resBodyOfSignUp = jsonDecode(res.body);
    } else {}
  } catch (e) {}
}

class _WidgetRegisterState extends State<WidgetRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      width: 300,
      decoration: BoxDecoration(
          color: Color.fromARGB(143, 255, 255, 255),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Registrasi',
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.w500, color: whiteColor),
          ),
          const SizedBox(
            height: 20,
          ),
          getTextField(
            controller: nikController,
            hintName: "No.NIK",
            keyboardType: TextInputType.number,
            inputFormatters: FilteringTextInputFormatter.digitsOnly,
          ),
          const SizedBox(
            height: 8,
          ),
          getTextField(
            controller: namaController,
            hintName: "Nama Lengkap",
            keyboardType: TextInputType.name,
            inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
          ),
          const SizedBox(
            height: 8,
          ),
          getTextField(
            controller: tlpController,
            hintName: "No.Telepon",
            keyboardType: TextInputType.number,
            inputFormatters: FilteringTextInputFormatter.digitsOnly,
          ),
          const SizedBox(
            height: 8,
          ),
          getTextField(
            controller: passwordController,
            hintName: "Password",
            isObscureText: true,
            keyboardType: TextInputType.name,
            inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 25, 0),
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  child: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                        BorderSide(width: 1.5, color: darkgreenColor)),
                    tristate: false,
                    activeColor: Colors.transparent,
                    value: _isChecked,
                    checkColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "Saya setuju syarat dan ketentuan",
                  style: GoogleFonts.poppins(color: blackColor, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 45,
                width: 120,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2BAE82),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        )),
                    onPressed: () {},
                    child: Text(
                      'Daftar',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sudah memiliki akun ?",
                  style: GoogleFonts.poppins(color: blackColor, fontSize: 12),
                ),
                InkWell(
                  child: Text(
                    " Login",
                    style: GoogleFonts.poppins(
                        color: darkgreenColor, fontSize: 13),
                  ),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => AppeareaceLogin()),
                        (Route<dynamic> route) => false);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
