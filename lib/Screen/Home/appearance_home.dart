import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/Home/widget_berita.dart';
import 'package:kepuharjo_app/Screen/Home/widget_surat.dart';
import 'package:kepuharjo_app/Screen/Home/widget_text_berita.dart';
import 'package:kepuharjo_app/Screen/Home/widget_text_surat.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class AppearanceHome extends StatefulWidget {
  const AppearanceHome({key});

  @override
  State<AppearanceHome> createState() => _AppearanceHomeState();
}

class _AppearanceHomeState extends State<AppearanceHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bglogo.png'),
                  fit: BoxFit.cover,
                  // colorFilter: ColorFilter.mode(
                  //     blackColor.withOpacity(0.3), BlendMode.dstATop),
                ),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF009FFD),
                    Color(0xFF2A2A72),
                  ],
                )),
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "S-Kepuharjo",
                          style: boldTextStyle.copyWith(
                              fontSize: 30, color: whiteColor),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Smart Aplikasi Pelayanan Pengajuan\nSurat Kelurahan Kepuharjo",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: whiteColor),
                        ),
                        Text(
                          "Jl.Langsep no.18, Kec. Lumajang, Kab. Lumajang",
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                              color: whiteColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              WidgetTextSurat(),
              WidgetSurat(),
              WidgetTextBerita(),
              WidgetBerita()
            ],
          ),
        ],
      ),
    );
  }
}
