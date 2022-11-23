import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetSurat extends StatefulWidget {
  const WidgetSurat({Key key}) : super(key: key);

  @override
  State<WidgetSurat> createState() => _WidgetSuratState();
}

GestureDetector getLetter(
  String title,
  int index,
) {
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
    },
    child: Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      height: 130,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 239, 239, 239),
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
                  fontSize: 12,
                  color: blackColor,
                  fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    ),
  );
}

class _WidgetSuratState extends State<WidgetSurat> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            getLetter("Surat Keterangan Tidak Mampu", 0),
            getLetter("Surat Keterangan Kematian", 1),
            getLetter("Surat Keterangan Pindah", 2),
            getLetter("Surat Keterangan Domisili", 3),
            getLetter("Surat Keterangan Usaha", 4),
          ],
        ),
      ),
    );
  }
}
