import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Screen/Home/widget_berita.dart';
import 'package:kepuharjo_app/Screen/Home/widget_surat.dart';
import 'package:kepuharjo_app/Screen/Home/widget_text_berita.dart';
import 'package:kepuharjo_app/Screen/Home/widget_text_surat.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class AppearanceHome extends StatefulWidget {
  const AppearanceHome({key});

  @override
  State<AppearanceHome> createState() => _AppearanceHomeState();
}

class _AppearanceHomeState extends State<AppearanceHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: Container(
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
                )),
            child: ListView(physics: BouncingScrollPhysics(), children: [
              Container(
                // margin: EdgeInsets.only(right: 10, top: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          Text(
                            "Kepuharjo App",
                            style: boldTextStyle.copyWith(
                                fontSize: 26, color: whiteColor),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Smart Aplikasi Pelayanan Pengajuan\nSurat Kelurahan Kepuharjo",
                            style: whiteTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: whiteColor),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Jl.Langsep no.18, Kecamatan Lumajang, Kabupaten Lumajang",
                            style: whiteTextStyle.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: whiteColor),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ClipRRect(
                        child: Image.asset(
                          "images/lambange.png",
                          height: 80,
                          width: 60,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ])),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              WidgetTextSurat(),
              WidgetSurat(),
              WidgetTextBerita(),
              WidgetBerita()
            ],
          ),
        ],
      ),
    );
  }
}
