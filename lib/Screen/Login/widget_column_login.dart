import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Comm/getTextField.dart';
import 'package:kepuharjo_app/Pages/fpass/fpass_tlp.dart';
import 'package:kepuharjo_app/Screen/NavButton/Home.dart';
import 'package:kepuharjo_app/Screen/Register/appearance_register.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetLogin extends StatefulWidget {
  const WidgetLogin({key});

  @override
  State<WidgetLogin> createState() => _WidgetLoginState();
}

bool _isChecked = false;
final nikController = TextEditingController();
final passwordController = TextEditingController();

class _WidgetLoginState extends State<WidgetLogin> {
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
            height: defaultPadding,
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
                Container(
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
                        _isChecked = value;
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FPassword()));
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
              Container(
                height: 45,
                width: 120,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2BAE82),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        )),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
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
                        color: darkgreenColor, fontSize: 13),
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
}
