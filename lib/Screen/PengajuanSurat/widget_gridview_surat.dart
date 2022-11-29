import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_tidakmampu.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetGridViewSurat extends StatefulWidget {
  const WidgetGridViewSurat({Key? key}) : super(key: key);

  @override
  State<WidgetGridViewSurat> createState() => _WidgetGridViewSuratState();
}

GestureDetector getLetter(
    BuildContext context, String title, int index, IconData icon) {
  return GestureDetector(
    onTap: () {
      if (index == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SKTM()));
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
        //6.item
      }
    },
    child: Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2A2A72),
            midGreen,
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: whiteColor,
              size: 40,
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
          getLetter(
            context,
            "Surat Keterangan Tidak Mampu",
            0,
            Icons.assignment_outlined,
          ),
          getLetter(
            context,
            "Surat Keterangan Belum Menikah",
            1,
            Icons.diamond,
          ),
          getLetter(
            context,
            "Surat Keterangan Domisili",
            2,
            Icons.location_on,
          ),
          getLetter(
            context,
            "Surat Keterangan Kematian",
            3,
            Icons.add_box_outlined,
          ),
          getLetter(
            context,
            "Surat Keterangan Akta Kelahiran",
            4,
            Icons.child_friendly,
          ),
          getLetter(
            context,
            "Surat Keterangan Pindah",
            5,
            Icons.house_rounded,
          ),
          getLetter(
            context,
            "Surat Keterangan Usaha",
            6,
            Icons.home_work,
          ),
        ],
      ),
    );
  }
}
