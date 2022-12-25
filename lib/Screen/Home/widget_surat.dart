import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/Domisili.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_belum_menikah.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_kematian.dart';
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
            context, MaterialPageRoute(builder: (context) => const SKTM()));
      }
      if (index == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Kematian()));
        //2.item
      }
      if (index == 2) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BelumNikah()));
        //3.item
      }
      if (index == 3) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Domisili()));
        //4.item
      }
      if (index == 4) {
        //5.item
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Usaha()));
      }
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      margin: const EdgeInsets.all(5),
      height: 130,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        // border: Border.all(color: appColor),
        image: const DecorationImage(
            image: AssetImage("images/newbgsa.png"),
            fit: BoxFit.cover,
            alignment: Alignment.centerRight,
            opacity: 0.3),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 15),
            blurRadius: 22,
            color: Colors.black.withOpacity(0.10),
          ),
          BoxShadow(
              offset: const Offset(-15, -15),
              blurRadius: 20,
              color: Colors.white.withOpacity(0.10))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: appColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  icon,
                  // size: 35,
                  color: appColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            textAlign: TextAlign.start,
            style: poppinsMediumBlack.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}

class _WidgetSuratState extends State<WidgetSurat> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
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
              "Surat Keterangan Belum Menikah",
              2,
              Icons.diamond,
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
