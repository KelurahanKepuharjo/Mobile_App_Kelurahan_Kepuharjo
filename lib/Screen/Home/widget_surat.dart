import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetSurat extends StatefulWidget {
  const WidgetSurat({Key? key}) : super(key: key);

  @override
  State<WidgetSurat> createState() => _WidgetSuratState();
}

GestureDetector getLetter(String title, int index, IconData icon) {
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
          color: Colors.white,
          // border: Border.all(),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 15),
              blurRadius: 22,
              color: Colors.black.withOpacity(0.10),
            ),
            BoxShadow(
                offset: Offset(-15, -15),
                blurRadius: 20,
                color: Colors.white.withOpacity(0.10))
          ]),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: Color(0xFF2A2A72),
            ),
            const SizedBox(
              height: 5,
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
            getLetter(
                "Surat Keterangan Tidak Mampu", 0, Icons.assignment_outlined),
            getLetter("Surat Keterangan Kematian", 1, Icons.add_box_outlined),
            getLetter("Surat Keterangan Pindah", 2, Icons.house_rounded),
            getLetter("Surat Keterangan Domisili", 3, Icons.location_on),
            getLetter("Surat Keterangan Usaha", 4, Icons.home_work),
          ],
        ),
      ),
    );
  }
}
