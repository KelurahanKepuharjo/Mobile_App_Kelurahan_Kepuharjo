import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class SemuaSurat extends StatefulWidget {
  const SemuaSurat({Key key}) : super(key: key);

  @override
  State<SemuaSurat> createState() => _SemuaSuratState();
}

class _SemuaSuratState extends State<SemuaSurat> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        leading: const CircleAvatar(),
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
        trailing: Container(
          height: 20,
          width: 70,
          decoration: BoxDecoration(
            color: Color(0xFF2A2A72).withOpacity(0.1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              "Disetujui",
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Color(0xFF2A2A72),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
