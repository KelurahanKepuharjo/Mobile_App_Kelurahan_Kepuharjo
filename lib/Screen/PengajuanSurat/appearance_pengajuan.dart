import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/widget_gridview_surat.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/widget_line.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/widget_text_surat.dart';

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
      backgroundColor: whiteColor,
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
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bglogo.png'),
                  fit: BoxFit.cover,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF009FFD),
                    Color(0xFF2A2A72),
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
            WidgetTextSurat(),
            WidgetDivider(),
            WidgetGridViewSurat(),
          ],
        ),
      ),
    );
  }
}
