import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Comm/getTextForm.dart';
import 'package:kepuharjo_app/Controller/RememberUser.dart';
import 'package:kepuharjo_app/Model/User_Model.dart';
import 'package:kepuharjo_app/Screen/LupaPassword/appearance_forgot_password.dart.dart';
import 'package:kepuharjo_app/Screen/NavButton/Home_Screen.dart';
import 'package:kepuharjo_app/Screen/Register/appearance_register.dart';
import 'package:kepuharjo_app/Shared/shared.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class WidgetLogin extends StatefulWidget {
  const WidgetLogin({Key key}) : super(key: key);

  @override
  State<WidgetLogin> createState() => _WidgetLoginState();
}

// final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class _WidgetLoginState extends State<WidgetLogin> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nikController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nikController.dispose();
    passwordController.dispose();
  }

  bool _loading = false;
  bool showpass = false;

  TextEditingController nikController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 15),
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
            style: poppinsLargeBlack.copyWith(
                fontSize: 20, fontWeight: FontWeight.w500),
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
            height: 15,
          ),
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                TextFormField(
                  textInputAction: TextInputAction.done,
                  obscureText: showpass,
                  controller: passwordController,
                  style: poppinsMediumBlack,
                  keyboardType: TextInputType.name,
                  enabled: true,
                  onSaved: (val) => passwordController,
                  validator: (String value) {
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
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      filled: true,
                      suffixIcon: InkWell(
                        child: Icon(
                            showpass ? Icons.visibility : Icons.visibility_off),
                        onTap: () {
                          setState(() {
                            showpass = !showpass;
                          });
                        },
                      ),
                      fillColor: Color.fromARGB(179, 234, 234, 234),
                      hintText: "Password",
                      hintStyle: GoogleFonts.poppins(fontSize: 12)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                const Spacer(),
                InkWell(
                  child: Text(
                    "Lupa password ?",
                    style: poppinsSmallBlack,
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
                          backgroundColor: Color(0xFF2A2A72),
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          )),
                      onPressed: () {
                        verifyLogin();
                      },
                      child: Text(
                        'Masuk',
                        style: poppinsLargeBlack.copyWith(
                            fontWeight: FontWeight.w400, color: Colors.white),
                      )),
                ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Belum memiliki akun ?",
                  style: poppinsSmallBlack,
                ),
                InkWell(
                  child: Text(
                    " Registrasi",
                    style: poppinsSmallBlack.copyWith(
                        color: Color(0xFF2A2A72), fontSize: 13),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AppearanceRegister()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void verifyLogin() {
    if (nikController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Nik Harus Diisi", backgroundColor: Colors.red);
    } else if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Password Harus Diisi", backgroundColor: Colors.red);
    } else {
      login();
    }
  }

  Future<List<User>> login() async {
    try {
      var response = await http.post(Uri.parse(ApiConnect.signin), body: {
        "id_akun": nikController.text,
        "password": passwordController.text
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success'] == true) {
          setState(() {
            _loading = true;
          });
          snackBarSucces();
          User userInfo = User.fromJson(data['user']);
          await RememberUser().storeUser(json.encode(userInfo));
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
              (Route<dynamic> route) => false);
        } else {
          setState(() {
            _loading = false;
          });
          snackBarFailed();
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      print(e.toString());
    }
  }

  snackBarFailed() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        content: AwesomeSnackbarContent(
            title: "Gagal",
            message: "Nik dan Password Salah",
            contentType: ContentType.failure)));
  }

  snackBarSucces() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        content: AwesomeSnackbarContent(
            title: "Berhasil",
            message: "Selamat, Anda Berhasil Login",
            contentType: ContentType.success)));
  }
}
