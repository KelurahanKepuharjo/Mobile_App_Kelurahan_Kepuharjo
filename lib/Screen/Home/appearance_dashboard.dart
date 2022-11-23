import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/Home/widget_berita.dart';
import 'package:kepuharjo_app/Screen/Home/widget_surat.dart';
import 'package:kepuharjo_app/Screen/Home/widget_text_berita.dart';
import 'package:kepuharjo_app/Screen/Home/widget_text_surat.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key key}) : super(key: key);

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                )),
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFF2A2A72),
            expandedHeight: 250,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 100, 20, 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "S-Kepuharjo",
                          style: boldTextStyle.copyWith(
                              fontSize: 30, color: whiteColor),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Smart Aplikasi Pelayanan Pengajuan\nSurat Kelurahan Kepuharjo",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: whiteColor),
                        ),
                        Text(
                          "Jl.Langsep no.18, Kec. Lumajang, Kab. Lumajang",
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                              color: whiteColor),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "images/mylogo.png",
                    width: 100,
                    fit: BoxFit.cover,
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: whiteColor,
              child: Column(
                children: const [
                  WidgetTextSurat(),
                  WidgetSurat(),
                  WidgetTextBerita(),
                  WidgetBerita()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
