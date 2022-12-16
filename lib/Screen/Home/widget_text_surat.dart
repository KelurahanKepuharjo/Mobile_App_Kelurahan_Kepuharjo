import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/appearance_pengajuan.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetTextSurat extends StatefulWidget {
  const WidgetTextSurat({Key key}) : super(key: key);

  @override
  State<WidgetTextSurat> createState() => _WidgetTextSuratState();
}

class _WidgetTextSuratState extends State<WidgetTextSurat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.zero,
            child: Text(
              "Pelayanan Masyarakat",
              style: poppinsMediumBlack.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.zero,
            child: SizedBox(
              height: 30,
              width: 70,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppearancePengajuan()));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.indigo.shade100),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ))),
                child: Text(
                  "See All",
                  textAlign: TextAlign.center,
                  style: poppinsSmallBlack.copyWith(
                    color: appColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
