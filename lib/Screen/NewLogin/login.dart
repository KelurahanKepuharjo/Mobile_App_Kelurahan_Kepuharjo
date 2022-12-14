import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/Login/widget_column_login.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class LoginKids extends StatefulWidget {
  const LoginKids({Key key}) : super(key: key);

  @override
  State<LoginKids> createState() => _LoginKidsState();
}

class _LoginKidsState extends State<LoginKids> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A2A72),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 100, 40, 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kelurahan Kepuharjo",
                    style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "Kabupaten Lumajang",
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 10, 10),
              child: Row(
                children: [
                  const Spacer(),
                  Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      "images/mylogo.png",
                      alignment: Alignment.topLeft,
                      height: 170,
                      width: 170,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [WidgetLogin()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
