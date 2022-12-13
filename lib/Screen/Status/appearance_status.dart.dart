import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/Status/SuratDomisili.dart';
import 'package:kepuharjo_app/Screen/Status/SuratSKTM.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class AppearanceStatus extends StatefulWidget {
  const AppearanceStatus({Key key}) : super(key: key);

  @override
  State<AppearanceStatus> createState() => _AppearanceStatusStatus();
}

class _AppearanceStatusStatus extends State<AppearanceStatus> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            title: Text(
              'Status Surat',
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold),
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: TabBar(
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.white,
                        labelStyle: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w500),
                        isScrollable: true,
                        indicator: BoxDecoration(
                          color: const Color(0xFF2A2A72),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        tabs: const [
                          Tab(text: "Surat Keterangan Tidak Mampu"),
                          Tab(text: "Surat Keterangan Belum Menikah"),
                          Tab(text: "Surat Keterangan Domisili"),
                          Tab(text: "Surat Keterangan Kematian"),
                          Tab(text: "Surat Keterangan Akta Kelahiran"),
                          Tab(text: "Surat Keterangan Pindah"),
                          Tab(text: "Surat Keterangan Usaha"),
                        ]),
                  ),
                ),
                Expanded(
                  child: TabBarView(children: [
                    SizedBox(
                      // height: 300,
                      child: Column(
                        children: const [
                          SuratSKTM(),
                        ],
                      ),
                    ),
                    SizedBox(
                      // height: 300,
                      child: Column(
                        children: const [
                          Text("Surat Keterangan Belum Menikah"),
                        ],
                      ),
                    ),
                    SizedBox(
                      // height: 300,
                      child: Column(
                        children: const [
                          SuratDomisili(),
                        ],
                      ),
                    ),
                    SizedBox(
                      // height: 300,
                      child: Column(
                        children: const [
                          Text("Surat Keterangan Kematian"),
                        ],
                      ),
                    ),
                    SizedBox(
                      // height: 300,
                      child: Column(
                        children: const [
                          Text("Surat Keterangan Akta Kelahiran"),
                        ],
                      ),
                    ),
                    SizedBox(
                      // height: 300,
                      child: Column(
                        children: const [
                          Text("Surat Keterangan Pindah"),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: const [
                          Text("Surat Keterangan Usaha"),
                        ],
                      ),
                    ),
                  ]),
                )
              ],
            ),
          )),
    );
  }
}
