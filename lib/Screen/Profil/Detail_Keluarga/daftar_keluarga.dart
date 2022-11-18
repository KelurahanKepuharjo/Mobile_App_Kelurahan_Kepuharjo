import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/Profil/Detail_Keluarga/widget_daftar_keluarga.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class DaftarKeluarga extends StatefulWidget {
  const DaftarKeluarga({Key key}) : super(key: key);

  @override
  State<DaftarKeluarga> createState() => _DaftarKeluargaState();
}

class _DaftarKeluargaState extends State<DaftarKeluarga> {
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
            child: Icon(Icons.keyboard_arrow_left),
          ),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'Daftar Keluarga',
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            WidgetDaftarKeluarga(),
          ],
        ),
      ),
    );
  }
}
