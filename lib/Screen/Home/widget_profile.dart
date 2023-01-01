import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Shared/shared.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileKelurahan extends StatefulWidget {
  const ProfileKelurahan({Key key}) : super(key: key);

  @override
  State<ProfileKelurahan> createState() => _ProfileKelurahanState();
}

class _ProfileKelurahanState extends State<ProfileKelurahan> {
  Future<void> downloadPdfKelembagaan() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();
      var filePath = '${dir.path}/kelembagaan.pdf';
      var data = await rootBundle.load('assets/pdf/kelembagaan.pdf');
      var bytes = data.buffer.asUint8List();
      await File(filePath).writeAsBytes(bytes);
      await OpenFile.open(filePath);
    } catch (e) {
      print(e);
    }
  }

  Future<void> downloadPdfTugas() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();
      var filePath = '${dir.path}/tugas.pdf';
      var data = await rootBundle.load('assets/pdf/tugas.pdf');
      var bytes = data.buffer.asUint8List();
      await File(filePath).writeAsBytes(bytes);
      await OpenFile.open(filePath);
    } catch (e) {
      print(e);
    }
  }

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
                onTap: () async {
                  var permissionStatus =
                      await Permission.storage.request().isGranted;

                  if (permissionStatus) {
                    await downloadPdfKelembagaan();
                  }
                },
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
                onTap: () async {
                  var permissionStatus =
                      await Permission.storage.request().isGranted;

                  if (permissionStatus) {
                    await downloadPdfTugas();
                  }
                },
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
