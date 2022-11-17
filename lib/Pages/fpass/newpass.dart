import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Comm/getTextField.dart';
import 'package:kepuharjo_app/Screen/Login/appearance_login.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class CreateNewPw extends StatefulWidget {
  CreateNewPw({key});

  @override
  State<CreateNewPw> createState() => _CreateNewPw();
}

class _CreateNewPw extends State<CreateNewPw> {
  final npController = TextEditingController();
  final cnpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        // leading: Padding(
        //   padding: EdgeInsets.all(8),
        //   child: GestureDetector(
        //     onTap: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => loginKids()));
        //     },
        //     child: Icon(Icons.keyboard_arrow_left),
        //   ),
        // ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'Create New Password',
          style: whiteTextStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    lightGreen,
                    midGreen,
                  ],
                ))),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "images/lock.png",
                  height: 100,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "Silahkan Masukan Password Anda Yang Baru",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  "Gunakanlah Password Yang Kuat",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              getTextField(
                controller: npController,
                hintName: " New Password",
                keyboardType: TextInputType.name,
                isObscureText: true,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(
                height: 10,
              ),
              getTextField(
                controller: npController,
                hintName: " Confirm Password",
                keyboardType: TextInputType.name,
                isObscureText: true,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    width: 250,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF2BAE82),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AppeareaceLogin()),
                              (Route<dynamic> route) => false);
                        },
                        child: Text(
                          'Simpan',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
