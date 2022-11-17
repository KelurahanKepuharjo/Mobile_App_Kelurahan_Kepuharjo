import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetTextSurat extends StatefulWidget {
  const WidgetTextSurat({Key key}) : super(key: key);

  @override
  State<WidgetTextSurat> createState() => _WidgetTextSuratState();
}

class _WidgetTextSuratState extends State<WidgetTextSurat> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Daftar Nama Surat : ",
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
