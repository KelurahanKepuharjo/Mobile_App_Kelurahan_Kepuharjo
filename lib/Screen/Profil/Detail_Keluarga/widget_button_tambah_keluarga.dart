import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/Profil/Detail_Keluarga/tambah_keluarga.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetButtonTambah extends StatefulWidget {
  const WidgetButtonTambah({Key key}) : super(key: key);

  @override
  State<WidgetButtonTambah> createState() => _WidgetButtonTambahState();
}

class _WidgetButtonTambahState extends State<WidgetButtonTambah> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 45,
          width: 300,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF2BAE82),
                Color.fromARGB(255, 81, 195, 159),
              ],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TambahKeluarga()));
              },
              icon: const Icon(Icons.add),
              label: Text(
                'Tambah Keluarga',
                style:
                    boldTextStyle.copyWith(fontSize: 18, color: Colors.white),
              )),
        ),
      ],
    );
  }
}
