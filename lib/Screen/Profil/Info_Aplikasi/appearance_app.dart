import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Screen/Profil/Info_Aplikasi/widget_text_profil.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class InfoAplikasi extends StatefulWidget {
  const InfoAplikasi({key});

  @override
  State<InfoAplikasi> createState() => _InfoAplikasiState();
}

class _InfoAplikasiState extends State<InfoAplikasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   stops: [0.2, 0.7],
          //   tileMode: TileMode.repeated,
          //   colors: [
          //     Color(0XFF0AAA57),
          //     Color(0XFF69D306),
          //   ],
          // ),
          color: whiteColor,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              WidgetTextVersion(),
            ],
          ),
        ),
      ),
    );
  }
}
