import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nikController;
    namaController;
    passwordController;
    cpasswordController;
    tlpController;
    rtController;
    rwController;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nikController.dispose();
    namaController.dispose();
    passwordController.dispose();
    cpasswordController.dispose();
    tlpController.dispose();
    rtController.dispose();
    rwController.dispose();
  }

  final nikController = TextEditingController();
  final namaController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();
  final tlpController = TextEditingController();
  final rtController = TextEditingController();
  final rwController = TextEditingController();
  bool _loading = false;
  bool showpass = false;
  bool showpass2 = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 540,
        width: 300,
        decoration: BoxDecoration(
            color: whiteColor.withOpacity(0.7),
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
              style: GoogleFonts.inter(
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
              length: 16,
            ),
            const SizedBox(
              height: 5,
            ),
            getTextForm(
              controller: namaController,
              hintName: "Nama Lengkap",
              keyboardType: TextInputType.name,
              inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
              length: 50,
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              children: [
                TextFormField(
                  textInputAction: TextInputAction.done,
                  obscureText: showpass,
                  controller: passwordController,
                  style: poppinsMediumBlack,
                  keyboardType: TextInputType.name,
                  enabled: true,
                  onSaved: (val) => passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Your Password';
                    }
                    return null;
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.singleLineFormatter,
                    LengthLimitingTextInputFormatter(20)
                  ],
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: appColor, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: appColor, width: 1)),
                      filled: false,
                      suffixIcon: InkWell(
                        child: Icon(
                          showpass ? Icons.visibility : Icons.visibility_off,
                          size: 20,
                        ),
                        onTap: () {
                          setState(() {
                            showpass = !showpass;
                          });
                        },
                      ),
                      fillColor: const Color.fromARGB(179, 234, 234, 234),
                      labelText: "Password",
                      labelStyle: GoogleFonts.poppins(fontSize: 12)),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              children: [
                TextFormField(
                  textInputAction: TextInputAction.done,
                  obscureText: showpass2,
                  controller: cpasswordController,
                  style: poppinsMediumBlack,
                  keyboardType: TextInputType.name,
                  enabled: true,
                  onSaved: (val) => cpasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Your Password';
                    }
                    return null;
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.singleLineFormatter,
                    LengthLimitingTextInputFormatter(20)
                  ],
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: appColor, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: appColor, width: 1)),
                      filled: false,
                      suffixIcon: InkWell(
                        child: Icon(
                          showpass2 ? Icons.visibility : Icons.visibility_off,
                          size: 20,
                        ),
                        onTap: () {
                          setState(() {
                            showpass2 = !showpass2;
                          });
                        },
                      ),
                      fillColor: const Color.fromARGB(179, 234, 234, 234),
                      labelText: "Konfirmasi Password",
                      labelStyle: GoogleFonts.poppins(fontSize: 12)),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            getTextForm(
              controller: tlpController,
              hintName: "No.Telepon",
              keyboardType: TextInputType.number,
              inputFormatters: FilteringTextInputFormatter.digitsOnly,
              length: 13,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 130,
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        controller: rtController,
                        style: poppinsSmallBlack.copyWith(fontSize: 13),
                        keyboardType: TextInputType.number,
                        onSaved: (newValue) => rtController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Your Rt';
                          }
                          return null;
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(5)
                        ],
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(width: 1, color: appColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(width: 1, color: appColor)),
                            filled: false,
                            fillColor: Color.fromARGB(179, 234, 234, 234),
                            labelText: "RT",
                            labelStyle: GoogleFonts.poppins(fontSize: 12)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        controller: rwController,
                        style: poppinsSmallBlack.copyWith(fontSize: 13),
                        keyboardType: TextInputType.number,
                        onSaved: (newValue) => rwController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Your Rw';
                          }
                          return null;
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(5)
                        ],
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(width: 1, color: appColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(width: 1, color: appColor)),
                            filled: false,
                            fillColor: Color.fromARGB(179, 234, 234, 234),
                            labelText: "RW",
                            labelStyle: GoogleFonts.poppins(fontSize: 12)),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            (_loading)
                ? SizedBox(
                    child: SpinKitCircle(
                    color: whiteColor,
                    size: 30,
                  ))
                : SizedBox(
                    height: 45,
                    width: 120,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: appColor,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          )),
                      onPressed: () {
                        setState(() {
                          verifyRegister();
                        });
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
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sudah memiliki akun ? ",
                    style: GoogleFonts.poppins(color: blackColor, fontSize: 11),
                  ),
                  InkWell(
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(color: appColor, fontSize: 12),
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
      ),
    );
  }

  void verifyRegister() {
    if (nikController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nik harus diisi");
    } else if (nikController.text.length < 16) {
      Fluttertoast.showToast(msg: "Nik tidak boleh kurang dari 16 karakter");
    } else if (namaController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nama Lengkap harus diisi");
    } else if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Password harus diisi");
    } else if (passwordController.text.length < 8) {
      Fluttertoast.showToast(
          msg: "Password tidak boleh kurang dari 8 karakter");
    } else if (cpasswordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Konfirmasi Password harus diisi");
    } else if (passwordController.text != cpasswordController.text) {
      Fluttertoast.showToast(msg: "Password harus sama");
    } else if (tlpController.text.isEmpty) {
      Fluttertoast.showToast(msg: "No.Telepon harus diisi");
    } else if (tlpController.text.length < 12) {
      Fluttertoast.showToast(
          msg: "No.Telepon tidak boleh kurang dari 12 angka");
    } else if (rtController.text.isEmpty) {
      Fluttertoast.showToast(msg: "RT harus diisi");
    } else if (rwController.text.isEmpty) {
      Fluttertoast.showToast(msg: "RW harus diisi");
    } else {
      register();
    }
  }

  String hakAkses = "4";
  Future register() async {
    try {
      var response = await http.post(Uri.parse(ApiConnect.signup), body: {
        "id_akun": nikController.text,
        "nama_lengkap": namaController.text,
        "password": passwordController.text,
        "no_hp": tlpController.text,
        "hak_akses": hakAkses,
        "rt": rtController.text,
        "rw": rwController.text,
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success'] == false) {
          setState(() {
            _loading = false;
          });
          snackBarFailed();
        } else {
          setState(() {
            _loading = true;
            nikController.clear();
            namaController.clear();
            passwordController.clear();
            cpasswordController.clear();
            tlpController.clear();
            rtController.clear();
            rwController.clear();
          });
          snackBarSucces();
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const AppeareaceLogin()),
              (Route<dynamic> route) => false);
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
