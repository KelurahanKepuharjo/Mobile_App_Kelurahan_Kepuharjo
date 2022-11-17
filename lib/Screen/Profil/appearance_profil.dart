import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/Profil/widget_button_logout.dart';
import 'package:kepuharjo_app/Screen/Profil/widget_myprofile.dart';
import 'package:kepuharjo_app/Screen/Profil/widget_option_setting.dart';
import 'package:kepuharjo_app/Screen/Profil/widget_text_profil.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class AppearanceProfil extends StatefulWidget {
  const AppearanceProfil({Key key}) : super(key: key);

  @override
  State<AppearanceProfil> createState() => _AppearanceProfilState();
}

class _AppearanceProfilState extends State<AppearanceProfil> {
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
          'Profil',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
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
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              WidgetMyProfil(),
              WidgetOptionsSetting(),
              WidgetTextVersion(),
              WidgetButtonLogOut(),
            ],
          ),
        ),
      ),
    );
  }
}
