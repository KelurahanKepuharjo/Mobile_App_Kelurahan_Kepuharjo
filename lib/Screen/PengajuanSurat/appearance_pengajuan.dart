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
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage('images/newbgsa.png'),
            fit: BoxFit.cover,
          ),
          color: Color(0xFF2A2A72),
        )),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
