import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetTextVersion extends StatefulWidget {
  const WidgetTextVersion({Key key}) : super(key: key);

  @override
  State<WidgetTextVersion> createState() => _WidgetTextVersionState();
}

class _WidgetTextVersionState extends State<WidgetTextVersion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 75),
      child: Center(
        child: Column(
          children: [
            Text(
              "Versi Aplikasi : 1.0",
              style: GoogleFonts.poppins(
                  fontSize: 10, fontWeight: FontWeight.w300),
            ),
            Text(
              "Pengembangan Versi : 1.0.0",
              style: GoogleFonts.poppins(
                  fontSize: 10, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
