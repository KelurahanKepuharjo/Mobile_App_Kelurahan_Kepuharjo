import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/Status/semua_surat.dart';
import 'package:kepuharjo_app/Screen/Status/surat_disetujui.dart';
import 'package:kepuharjo_app/Screen/Status/surat_ditolak.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class AppearanceStatus extends StatefulWidget {
  const AppearanceStatus();

  @override
  State<AppearanceStatus> createState() => _AppearanceStatusStatus();
}

class _AppearanceStatusStatus extends State<AppearanceStatus> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Text(
            'Status Surat',
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Proses",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: whiteColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Disetujui",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: whiteColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Ditolak",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: whiteColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Selesai",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: whiteColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          flexibleSpace: Container(
              decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/newbgsa.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: Color(0xFF2A2A72),
          )),
        ),
        body: TabBarView(children: [
          Container(
            color: Colors.white,
            child: Column(
              children: const [
                SemuaSurat(),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: const [
                SuratDisetujui(),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: const [
                SuratDitolak(),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: const [
                SuratDitolak(),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
