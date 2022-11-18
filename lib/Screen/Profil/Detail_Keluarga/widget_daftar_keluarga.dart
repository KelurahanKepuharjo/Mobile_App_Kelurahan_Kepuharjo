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
      children: [
        ClipRRect(
          child: Image.asset(
            img,
            height: 80,
            width: 80,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            Text(nama),
          ],
        ),
        const SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UbahKeluarga()));
          },
          child: Text(
            "Ubah",
            style: GoogleFonts.poppins(
                color: whiteColor, fontSize: 10, fontWeight: FontWeight.w300),
          ),
        )
      ],
    ),
  );
}

class _WidgetDaftarKeluargaState extends State<WidgetDaftarKeluarga> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            daftarKeluarga(
              context,
              "images/email3.png",
              "Achmad Fawaid",
            ),
            daftarKeluarga(
              context,
              "images/email3.png",
              "Achmad Fawaid",
            ),
            daftarKeluarga(
              context,
              "images/email3.png",
              "Achmad Fawaid",
            ),
          ],
        )
      ],
    );
  }
}
