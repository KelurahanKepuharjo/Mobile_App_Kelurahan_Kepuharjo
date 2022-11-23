import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/Status/widget_banner.dart';
import 'package:kepuharjo_app/Screen/Status/widget_timeline_wrapper.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class AppearanceStatus extends StatefulWidget {
  const AppearanceStatus();

  @override
  State<AppearanceStatus> createState() => _AppearanceStatusStatus();
}

List<String> _list = [
  'Achmad Fawaid',
];

class _AppearanceStatusStatus extends State<AppearanceStatus> {
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
          'Status Surat',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bglogo.png'),
                  fit: BoxFit.cover,
                  // colorFilter: ColorFilter.mode(
                  //     blackColor.withOpacity(0.3), BlendMode.dstATop),
                ),
                // borderRadius: const BorderRadius.only(
                //     bottomLeft: Radius.circular(20),
                //     bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF009FFD),
                    Color(0xFF2A2A72),
                  ],
                ))),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          WidgetBanner(),
          WidgetTimelineWrapper(),
        ],
      ),
    );
  }
}
