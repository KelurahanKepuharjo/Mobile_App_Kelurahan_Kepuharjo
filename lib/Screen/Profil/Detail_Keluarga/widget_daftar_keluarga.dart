import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/Profil/Detail_Keluarga/ubah_keluarga.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetDaftarKeluarga extends StatefulWidget {
  const WidgetDaftarKeluarga({Key key}) : super(key: key);

  @override
  State<WidgetDaftarKeluarga> createState() => _WidgetDaftarKeluargaState();
}

Padding daftarKeluarga(BuildContext context, String img, String nama) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              nama,
              style: GoogleFonts.poppins(
                  color: blackColor, fontSize: 14, fontWeight: FontWeight.w300),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UbahKeluarga()));
          },
          child: Text(
            "Ubah",
            style: GoogleFonts.poppins(
                color: greenColor, fontSize: 12, fontWeight: FontWeight.w300),
          ),
        )
      ],
    ),
  );
}

class _WidgetDaftarKeluargaState extends State<WidgetDaftarKeluarga> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: ListView(
          children: [
            daftarKeluarga(
              context,
              "images/email3.png",
              "Achmad Fawaid",
            ),
          ],
        ),
      ),
    );
  }
}
