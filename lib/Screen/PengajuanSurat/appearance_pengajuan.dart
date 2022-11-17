import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/widget_gridview_surat.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/widget_text_surat.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/widget_dropdown.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class AppearancePengajuan extends StatefulWidget {
  const AppearancePengajuan({key});

  @override
  State<AppearancePengajuan> createState() => _AppearancePengajuanState();
}

class _AppearancePengajuanState extends State<AppearancePengajuan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Pengajuan Surat',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    lightGreen,
                    midGreen,
                  ],
                ))),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            WidgetDropDownPerson(),
            WidgetTextSurat(),
            WidgetGridViewSurat(),
          ],
        ),
      ),
    );
  }
}
