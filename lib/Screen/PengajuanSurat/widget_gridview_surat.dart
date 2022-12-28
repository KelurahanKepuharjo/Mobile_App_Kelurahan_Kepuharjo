import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/Domisili.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_akta_kelahiran.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_berkelakuan_baik.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_kematian.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_tidak_mampu.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_belum_menikah.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_usaha.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratPengajuan/sAkta.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratPengajuan/sBelumNikah.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratPengajuan/sBerkelakuanBaik.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratPengajuan/sDomisili.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratPengajuan/sSktm.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratPengajuan/sUsaha.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetGridViewSurat extends StatefulWidget {
  const WidgetGridViewSurat({Key key}) : super(key: key);

  @override
  State<WidgetGridViewSurat> createState() => _WidgetGridViewSuratState();
}

GestureDetector getLetter(
    BuildContext context, String title, int index, IconData icon) {
  return GestureDetector(
    onTap: () {
      if (index == 0) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PengajuanSktm()));
      }
      if (index == 1) {
        //2.item
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PengajuanBelumNikah()));
      }
      if (index == 2) {
        //3.item
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PengajuanDomisili()));
      }
      if (index == 3) {
        //4.item
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Kematian()));
      }
      if (index == 4) {
        //5.item
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PengajuanAkta()));
      }
      if (index == 5) {
        //6.item
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PengajuanBerkelakuanBaik()));
      }
      if (index == 6) {
        //6.item
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PengajuanUsaha()));
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
            appColor,
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
            "Surat Keterangan Kenal Lahir",
            4,
            Icons.child_friendly,
          ),
          getLetter(
            context,
            "Surat Keterangan Berkelakuan Baik",
            5,
            Icons.people_alt,
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
