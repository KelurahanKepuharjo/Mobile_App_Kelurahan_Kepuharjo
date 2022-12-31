import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class ProfileKelurahan extends StatefulWidget {
  const ProfileKelurahan({Key key}) : super(key: key);

  @override
  State<ProfileKelurahan> createState() => _ProfileKelurahanState();
}

class _ProfileKelurahanState extends State<ProfileKelurahan> {
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
        backgroundColor: appColor,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Profil Kelurahan',
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ListTile(
                onTap: () {},
                title: Text(
                  "Kelembagaan",
                  style:
                      poppinsMediumBlack.copyWith(fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                  color: blackColor,
                ),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  "Tugas Pokok dan Fungsi",
                  style:
                      poppinsMediumBlack.copyWith(fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                  color: blackColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Kelembagaan extends StatefulWidget {
  const Kelembagaan({Key key}) : super(key: key);

  @override
  State<Kelembagaan> createState() => _KelembagaanState();
}

class _KelembagaanState extends State<Kelembagaan> {
  // PDFDocument _pdfDocument;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: PDF(),
    );
  }
}
