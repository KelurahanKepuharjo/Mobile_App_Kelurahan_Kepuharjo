import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetGridViewSurat extends StatefulWidget {
  const WidgetGridViewSurat({Key key}) : super(key: key);

  @override
  State<WidgetGridViewSurat> createState() => _WidgetGridViewSuratState();
}

GestureDetector getLetter(String title, int index) {
  return GestureDetector(
    onTap: () {
      if (index == 0) {
        //1.item
      }
      if (index == 1) {
        //2.item
      }
      if (index == 2) {
        //3.item
      }
      if (index == 3) {
        //4.item
      }
      if (index == 4) {
        //5.item
      }
      if (index == 5) {
        //6.item
      }
      if (index == 6) {
        //7.item
      }
      if (index == 7) {
        //8.item
      }
      if (index == 8) {
        //9.item
      }
      if (index == 9) {
        //10.item
      }
      if (index == 10) {
        //11.item
      }
    },
    child: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.indigo.shade800,
            midGreen,
            // Color(0xFF2BAE82),
            // Color.fromARGB(255, 81, 195, 159),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/email3.png",
              height: 50,
              width: 50,
              alignment: Alignment.topCenter,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: whiteColor,
                  fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    ),
  );
}

class _WidgetGridViewSuratState extends State<WidgetGridViewSurat> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          getLetter("Surat Keterangan Tidak Mampu", 0),
          getLetter("Surat Keterangan Belum Menikah", 1),
          getLetter("Surat Keterangan Bepergian", 2),
          getLetter("Surat Keterangan Berkelakuan Baik (SKCK)", 3),
          getLetter("Surat Keterangan Domisili", 4),
          getLetter("Surat Keterangan Identitas", 5),
          getLetter("Surat Keterangan Kematian", 6),
          getLetter("Surat Keterangan Kenal Lahir", 7),
          getLetter("Surat Keterangan Keramaian", 8),
          getLetter("Surat Keterangan Pindah", 9),
          getLetter("Surat Keterangan Usaha", 10),
        ],
      ),
    );
  }
}
