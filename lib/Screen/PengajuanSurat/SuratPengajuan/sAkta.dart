import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_akta_kelahiran.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_tidak_mampu.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratMe/AktaMe.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratMe/SktmMe.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class PengajuanAkta extends StatefulWidget {
  const PengajuanAkta({Key key}) : super(key: key);

  @override
  State<PengajuanAkta> createState() => _PengajuanSktmState();
}

class _PengajuanSktmState extends State<PengajuanAkta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.keyboard_arrow_left),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'Surat Keterangan Kenal Lahir',
          style: GoogleFonts.poppins(
              color: whiteColor, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
            decoration: BoxDecoration(
                color: appColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ))),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AktaMe()));
                  },
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: appColor.withOpacity(0.1),
                    ),
                    child: Icon(
                      Icons.person_rounded,
                      color: appColor,
                    ),
                  ),
                  title: Text("Pengajuan Untuk Diri Sendiri",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: appColor,
                      )),
                  trailing: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.shade200,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: blackColor,
                      size: 15,
                    ),
                  )),
              const Divider(),
              ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Akta()));
                  },
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: appColor.withOpacity(0.1),
                    ),
                    child: Icon(
                      Icons.people_sharp,
                      color: appColor,
                    ),
                  ),
                  title: Text("Pengajuan Untuk Orang Lain",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: appColor,
                      )),
                  trailing: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.shade200,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: blackColor,
                      size: 15,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
