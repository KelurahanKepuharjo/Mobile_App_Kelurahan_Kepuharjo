import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/Status/SuratAkta.dart';
import 'package:kepuharjo_app/Screen/Status/SuratBelumMenikah.dart';
import 'package:kepuharjo_app/Screen/Status/SuratDomisili.dart';
import 'package:kepuharjo_app/Screen/Status/SuratPindah.dart';
import 'package:kepuharjo_app/Screen/Status/SuratSKTM.dart';
import 'package:kepuharjo_app/Screen/Status/SuratSelesai/SuratAkta.dart';
import 'package:kepuharjo_app/Screen/Status/SuratSelesai/SuratBelumNikah.dart';
import 'package:kepuharjo_app/Screen/Status/SuratSelesai/SuratDomisili.dart';
import 'package:kepuharjo_app/Screen/Status/SuratSelesai/SuratKematian.dart';
import 'package:kepuharjo_app/Screen/Status/SuratSelesai/SuratPindah.dart';
import 'package:kepuharjo_app/Screen/Status/SuratSelesai/SuratSktm.dart';
import 'package:kepuharjo_app/Screen/Status/SuratSelesai/SuratUsaha.dart';
import 'package:kepuharjo_app/Screen/Status/SuratUsaha.dart';
import 'package:kepuharjo_app/Screen/Status/suratKematian.dart';
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
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('images/newbgsa.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: appColor)),
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
                          color: appColor,
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
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SktmSelesai()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Lihat Surat Yang Selesai",
                                    style: poppinsSmallBlack,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SuratSKTM(),
                        ],
                      ),
                    ),
                    SizedBox(
                      // height: 300,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const BelumNikahSelesai()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Lihat Surat Yang Selesai",
                                    style: poppinsSmallBlack,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SuratBelumNikah(),
                        ],
                      ),
                    ),
                    SizedBox(
                      // height: 300,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DomisiliSelesai()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Lihat Surat Yang Selesai",
                                    style: poppinsSmallBlack,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SuratDomisili(),
                        ],
                      ),
                    ),
                    SizedBox(
                      // height: 300,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const KematianSelesai()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Lihat Surat Yang Selesai",
                                    style: poppinsSmallBlack,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SuratKematian(),
                        ],
                      ),
                    ),
                    SizedBox(
                      // height: 300,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AktaSelesai()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Lihat Surat Yang Selesai",
                                    style: poppinsSmallBlack,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SuratAkta(),
                        ],
                      ),
                    ),
                    SizedBox(
                      // height: 300,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PindahSelesai()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Lihat Surat Yang Selesai",
                                    style: poppinsSmallBlack,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SuratPindah(),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const UsahaSelesai()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Lihat Surat Yang Selesai",
                                    style: poppinsSmallBlack,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SuratUsaha(),
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
