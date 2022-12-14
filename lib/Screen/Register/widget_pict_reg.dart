import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetPictureReg extends StatefulWidget {
  const WidgetPictureReg({Key key}) : super(key: key);

  @override
  State<WidgetPictureReg> createState() => _WidgetPictureRegState();
}

class _WidgetPictureRegState extends State<WidgetPictureReg> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 100, 20, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kelurahan Kepuharjo",
                style: GoogleFonts.inter(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "Kabupaten Lumajang",
                style: GoogleFonts.inter(
                    fontSize: 18,
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
                opacity: 0.5,
                child: Image.asset(
                  "images/mylogo.png",
                  alignment: Alignment.topLeft,
                  height: 100,
                  width: 100,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
