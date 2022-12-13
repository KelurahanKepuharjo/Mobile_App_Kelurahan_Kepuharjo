import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/Domisili.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_kematian.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_pindah.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_tidak_mampu.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_usaha.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetSurat extends StatefulWidget {
  const WidgetSurat({Key key}) : super(key: key);

  @override
  State<WidgetSurat> createState() => _WidgetSuratState();
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Kematian()));
        //2.item
      }
      if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pindah()));
        //3.item
      }
      if (index == 3) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Domisili()));
        //4.item
      }
      if (index == 4) {
        //5.item
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Usaha()));
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
              style: poppinsSmallBlack.copyWith(fontWeight: FontWeight.normal),
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
              context,
              "Surat Keterangan Tidak Mampu",
              0,
              Icons.assignment_outlined,
            ),
            getLetter(
              context,
              "Surat Keterangan Kematian",
              1,
              Icons.add_box_outlined,
            ),
            getLetter(
              context,
              "Surat Keterangan Pindah",
              2,
              Icons.house_rounded,
            ),
            getLetter(
              context,
              "Surat Keterangan Domisili",
              3,
              Icons.location_on,
            ),
            getLetter(
              context,
              "Surat Keterangan Usaha",
              4,
              Icons.home_work,
            ),
          ],
        ),
      ),
    );
  }
}
