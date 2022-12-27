import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetPelayananSurat extends StatefulWidget {
  const WidgetPelayananSurat({Key key}) : super(key: key);

  @override
  State<WidgetPelayananSurat> createState() => _WidgetPelayananSuratState();
}

class _WidgetPelayananSuratState extends State<WidgetPelayananSurat> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 165,
          child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            children: [
              getMenu("Tidak Mampu", Icons.assignment),
              getMenu("Usaha", Icons.home_work),
              getMenu("Kematian", Icons.add_box_outlined),
              getMenu("Domisili", Icons.location_on),
              getMenu("Belum Nikah", Icons.diamond),
              getMenu("Kenal Lahir", Icons.child_friendly),
              getMenu("Berkelakuan Baik", Icons.people_alt),
              getMenu("Lainnya", Icons.grid_view_rounded)
            ],
          )),
    );
  }

  GestureDetector getMenu(String text, IconData icon) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: greyColor.withOpacity(0.5)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Color(0xff102286),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: poppinsSmallBlack.copyWith(fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }
}
