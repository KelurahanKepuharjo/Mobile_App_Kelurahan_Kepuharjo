import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetPicture extends StatefulWidget {
  const WidgetPicture({Key key}) : super(key: key);

  @override
  State<WidgetPicture> createState() => _WidgetPictureState();
}

class _WidgetPictureState extends State<WidgetPicture> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 100, 0, 50),
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
      ),
    );
  }
}
