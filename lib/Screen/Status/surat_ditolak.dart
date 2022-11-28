import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class SuratDitolak extends StatefulWidget {
  const SuratDitolak({Key? key}) : super(key: key);

  @override
  State<SuratDitolak> createState() => _SuratDitolakState();
}

class _SuratDitolakState extends State<SuratDitolak> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        leading: CircleAvatar(),
        title: Text(
          "Nama Orang",
          style: GoogleFonts.poppins(
              fontSize: 14, color: blackColor, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          "Jenis Surat",
          style: GoogleFonts.poppins(
              fontSize: 14, color: blackColor, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
