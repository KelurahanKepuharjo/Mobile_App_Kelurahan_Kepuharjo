import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Controller/Current_UserLogin.dart';
import 'package:kepuharjo_app/Screen/Home/widget_berita.dart';
import 'package:kepuharjo_app/Screen/Home/widget_pelayanan_surat.dart';
import 'package:kepuharjo_app/Screen/Home/widget_headers.dart';
import 'package:kepuharjo_app/Screen/Home/widget_surat.dart';
import 'package:kepuharjo_app/Screen/Home/widget_text_berita.dart';
import 'package:kepuharjo_app/Screen/Home/widget_text_surat.dart';
import 'package:kepuharjo_app/Screen/Profil/Detail_Profil/user_profile.dart';
import 'package:kepuharjo_app/Screen/Profil/appearance_profil.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class AppearanceHome extends StatefulWidget {
  const AppearanceHome({Key key}) : super(key: key);

  @override
  State<AppearanceHome> createState() => _AppearanceHomeState();
}

class _AppearanceHomeState extends State<AppearanceHome> {
  final CurrentUser _currentUser = CurrentUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.98),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        backgroundColor: whiteColor,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 8,
              ),
              child: Text(
                "S-Kepuharjo",
                style: GoogleFonts.inter(
                    fontSize: 20, fontWeight: FontWeight.bold, color: appColor),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileUser(),
                      ));
                },
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: appColor,
                  child: const CircleAvatar(
                    radius: 20,
                    // backgroundColor: Colors.white,
                    backgroundImage: AssetImage("images/user.png"),
                  ),
                ),
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          WidgetHeaders(),
          WidgetTextSurat(),
          WidgetPelayananSurat(),
          WidgetTextBerita(),
          WidgetBerita()
        ],
      ),
    );
  }
}
