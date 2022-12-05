import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Model/RememberUser.dart';
import 'package:kepuharjo_app/Screen/Home/widget_berita.dart';
import 'package:kepuharjo_app/Screen/Home/widget_surat.dart';
import 'package:kepuharjo_app/Screen/Home/widget_text_berita.dart';
import 'package:kepuharjo_app/Screen/Home/widget_text_surat.dart';
import 'package:kepuharjo_app/Screen/Login/appearance_login.dart';
import 'package:kepuharjo_app/Shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppearanceHome extends StatefulWidget {
  const AppearanceHome({key});

  @override
  State<AppearanceHome> createState() => _AppearanceHomeState();
}

class _AppearanceHomeState extends State<AppearanceHome> {
  checkLogin() async {
    var user = RememberUser().getUser();
    if (user == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => AppeareaceLogin()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Color(0xFF2A2A72),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 80, 0, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "S-Kepuharjo",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: whiteColor),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Smart Aplikasi Pelayanan Pengajuan\nSurat Kelurahan Kepuharjo",
                        style: poppinsSmallBlack.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: whiteColor),
                      ),
                      Text(
                        "Jl.Langsep no.18, Kec. Lumajang, Kab. Lumajang",
                        style: poppinsSmallBlack.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            color: whiteColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Image.asset(
                    "images/mylogo.png",
                    width: 100,
                    fit: BoxFit.cover,
                    alignment: Alignment.centerRight,
                  ),
                ),
              ],
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          WidgetTextSurat(),
          WidgetSurat(),
          WidgetTextBerita(),
          WidgetBerita()
        ],
      ),
    );
  }
}
