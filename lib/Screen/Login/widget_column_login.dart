import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:kepuharjo_app/Api_connect/Api_connect.dart';
import 'package:kepuharjo_app/Comm/getTextField.dart';
import 'package:kepuharjo_app/Screen/LupaPassword/appearance_forgot_password.dart.dart';
import 'package:kepuharjo_app/Screen/NavButton/Home.dart';
import 'package:kepuharjo_app/Screen/Register/appearance_register.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetLogin extends StatefulWidget {
  const WidgetLogin({key});

  @override
  State<WidgetLogin> createState() => _WidgetLoginState();
}

bool _isChecked = false;
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class _WidgetLoginState extends State<WidgetLogin> {
  final nikController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: 300,
      decoration: BoxDecoration(
          color: const Color.fromARGB(143, 255, 255, 255),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 25,
          ),
          Text(
            'Login',
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.w500, color: blackColor),
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
            height: 15,
          ),
          getTextField(
            controller: passwordController,
            hintName: "Password",
            isObscureText: true,
            keyboardType: TextInputType.name,
            inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 25, 0),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                  height: 10,
                  child: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                        const BorderSide(width: 1.5, color: Colors.black)),
                    tristate: false,
                    activeColor: Colors.transparent,
                    value: _isChecked,
                    checkColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "Ingatkan saya",
                  style: GoogleFonts.poppins(color: blackColor, fontSize: 12),
                ),
                const Spacer(),
                InkWell(
                  child: Text(
                    "Lupa password ?",
                    style: GoogleFonts.poppins(color: blackColor, fontSize: 12),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppearanceForgotPassword()));
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 45,
                width: 120,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2A2A72),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        )),
                    onPressed: () {
                      login();
                    },
                    child: Text(
                      'Masuk',
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
                  "Belum memiliki akun ?",
                  style: GoogleFonts.poppins(color: blackColor, fontSize: 12),
                ),
                InkWell(
                  child: Text(
                    " Register",
                    style: GoogleFonts.poppins(
                        color: Color(0xFF2A2A72), fontSize: 13),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppearanceRegister()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future login() async {
    var response = await http.post(Uri.parse(ApiConnect.signin), body: {
      "id_akun": nikController.text,
      "password": passwordController.text
    });
    var data = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        if (data.toString() == 'Berhasil Login') {
          Fluttertoast.showToast(msg: "Berhasil kids");
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        } else {
          Fluttertoast.showToast(msg: "YAhh gagal");
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
