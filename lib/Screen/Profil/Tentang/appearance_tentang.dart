import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class AppearanceTentang extends StatefulWidget {
  const AppearanceTentang({Key key}) : super(key: key);

  @override
  State<AppearanceTentang> createState() => _AppearanceTentangState();
}

class _AppearanceTentangState extends State<AppearanceTentang> {
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
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'Tentang',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
            decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: appColor,
        )),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                  child: Image.asset("images/logo.png"),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Tentang",
                          style: GoogleFonts.poppins(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "          S-kepuharjo merupakan aplikasi berbasis website dan mobile kepuharjo ini dapat digunakan oleh pihak masyarakat, RT, dan RW serta website khusus untuk pihak Admin Kelurahan yang digunakan untuk menampung surat sekaligus digunakan untuk data master dari masyarakat, dan diharapkan juga aplikasi pengajuan surat untuk masyarakat ini dapat dilakukan dimanapun dan kapanpun sehingga menjadi lebih efektif dan efisien.",
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "          S-Kepuharjo termasuk upaya meningkatkan transparansi, kontrol serta akuntabilitas kinerja kelurahan dalam proses penanganan surat pengajuan dari masyarakat. Memperbaiki kualitas pelayanan publik untuk pengajuan surat pada tahap RT/RW, terutama dalam hal efektivitas dan efisiensi yang bisa memakan waktu berhari hari karena situasi pandemi. Mempermudah masyarakat dalam melakukan pengajuan berbagai macam jenis surat kepada pihak kelurahan",
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "@ 2022 S-Kepuharjo",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey.shade400),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
