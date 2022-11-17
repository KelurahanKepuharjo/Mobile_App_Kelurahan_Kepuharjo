import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetTextBerita extends StatefulWidget {
  const WidgetTextBerita({Key key}) : super(key: key);

  @override
  State<WidgetTextBerita> createState() => _WidgetTextBeritaState();
}

class _WidgetTextBeritaState extends State<WidgetTextBerita> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              "Berita Terkini",
              style: GoogleFonts.poppins(
                  fontSize: 14, color: greenColor, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
