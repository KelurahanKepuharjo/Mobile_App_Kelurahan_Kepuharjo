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
          color: greenColor,
          //     gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Color(0XFF0AAA57),
          //     Color(0XFF69D306),
          //   ],
          // ),
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
