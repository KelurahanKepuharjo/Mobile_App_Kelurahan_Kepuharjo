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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'Buat Password Baru',
          style: GoogleFonts.poppins(
              color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF009FFD),
            Color(0xFF2A2A72),
          ],
        ))),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
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
                    fontWeight: FontWeight.w300,
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
                    fontWeight: FontWeight.w300,
                    color: blackColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              getTextField(
                controller: npController,
                hintName: " Password Baru",
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
                hintName: " Konfirmasi Password",
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
                  SizedBox(
                    height: 45,
                    width: 250,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF009FFD),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const AppeareaceLogin()),
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
