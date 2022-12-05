import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Comm/getTextForm.dart';
import 'package:kepuharjo_app/Screen/Login/appearance_login.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetRegister extends StatefulWidget {
  const WidgetRegister({Key key}) : super(key: key);

  @override
  State<WidgetRegister> createState() => _WidgetRegisterState();
}

class _WidgetRegisterState extends State<WidgetRegister> {
  final nikController = TextEditingController();
  final namaController = TextEditingController();
  final passwordController = TextEditingController();
  final tlpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 450,
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
                fontSize: 20, fontWeight: FontWeight.w500, color: blackColor),
          ),
          const SizedBox(
            height: 20,
          ),
          getTextForm(
            controller: nikController,
            hintName: "No.NIK",
            keyboardType: TextInputType.number,
            inputFormatters: FilteringTextInputFormatter.digitsOnly,
          ),
          const SizedBox(
            height: 8,
          ),
          getTextForm(
            controller: namaController,
            hintName: "Nama Lengkap",
            keyboardType: TextInputType.name,
            inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
          ),
          const SizedBox(
            height: 8,
          ),
          getTextForm(
            controller: passwordController,
            hintName: "Password",
            isObscureText: true,
            keyboardType: TextInputType.name,
            inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
          ),
          const SizedBox(
            height: 8,
          ),
          getTextForm(
            controller: tlpController,
            hintName: "No.Telepon",
            keyboardType: TextInputType.number,
            inputFormatters: FilteringTextInputFormatter.digitsOnly,
          ),
          const SizedBox(
            height: 15,
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
                    verifyRegister();
                  },
                  child: Text(
                    'Daftar',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
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
                        color: Color(0xFF2A2A72), fontSize: 13),
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

  void verifyRegister() {
    if (nikController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nik harus diisi");
    } else if (namaController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nama Lengkap harus diisi");
    } else if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Password harus diisi");
    } else if (tlpController.text.isEmpty) {
      Fluttertoast.showToast(msg: "No.Telepon harus diisi");
    } else {
      register();
    }
  }

  Future register() async {
    var response = await http.post(Uri.parse(ApiConnect.signup), body: {
      "id_akun": nikController.text,
      "nama_lengkap": namaController.text,
      "password": passwordController.text,
      "no_hp": tlpController.text,
    });
    var data = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        if (data == "Error") {
          snackBarFailed();
        } else {
          snackBarSucces();
          setState(() {
            nikController.clear();
            namaController.clear();
            passwordController.clear();
            tlpController.clear();
          });
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  snackBarFailed() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        content: AwesomeSnackbarContent(
            title: "Gagal",
            message: "Nik sudah digunakan, Silahkan menggunakan Nik yang lain",
            contentType: ContentType.failure)));
  }

  snackBarSucces() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        content: AwesomeSnackbarContent(
            title: "Berhasil",
            message: "Selamat, Registrasi Akun Berhasil",
            contentType: ContentType.success)));
  }
}
