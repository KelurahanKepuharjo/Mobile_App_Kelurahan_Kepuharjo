import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class SuratDisetujui extends StatefulWidget {
  const SuratDisetujui({Key key}) : super(key: key);

  @override
  State<SuratDisetujui> createState() => _SuratDisetujuiState();
}

class _SuratDisetujuiState extends State<SuratDisetujui> {
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
        trailing: InkWell(
          onTap: () {},
          child: Container(
            height: 35,
            width: 90,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
              color: Color(0xFF2A2A72).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: Text(
                  "Download",
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: blackColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
