import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetTextVersion extends StatefulWidget {
  const WidgetTextVersion({Key key}) : super(key: key);

  @override
  State<WidgetTextVersion> createState() => _WidgetTextVersionState();
}

class _WidgetTextVersionState extends State<WidgetTextVersion> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              "images/logo.png",
              height: 200,
            ),
          ),
          Text(
            "Versi Aplikasi : 1.0",
            style: GoogleFonts.poppins(
                fontSize: 14, fontWeight: FontWeight.w300, color: blackColor),
          ),
          Text(
            "@ 2022 S-Kepuharjo",
            style: GoogleFonts.poppins(
                fontSize: 12, fontWeight: FontWeight.w300, color: blackColor),
          ),
        ],
      ),
    );
  }
}
