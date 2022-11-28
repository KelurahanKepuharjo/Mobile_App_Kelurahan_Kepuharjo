import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:kepuharjo_app/Screen/Home/widget_surat.dart';
import 'package:kepuharjo_app/Screen/Home/widget_text_berita.dart';
import 'package:kepuharjo_app/Screen/Home/widget_text_surat.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

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
                    padding: const EdgeInsets.fromLTRB(20, 100, 0, 0),
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
                children: [
                  WidgetTextSurat(),
                  WidgetSurat(),
                  WidgetTextBerita(),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: FutureBuilder(
                        future: getRequest(),
                        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                          if (snapshot.data == null) {
                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else {
                            return Expanded(
                              child: ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (ctx, index) => ListTile(
                                  title: Text(snapshot.data[index].judul),
                                  subtitle:
                                      Text(snapshot.data[index].sub_title),
                                  contentPadding: EdgeInsets.only(bottom: 20.0),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<List<Berita>> getRequest() async {
    //replace your restFull API here.
    String url =
        "http://192.168.1.20/Web_Kelurahan_Kepuharjo/Api/read_berita.php";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        List<Berita> news = [];
        for (var i in responseData) {
          Berita brt = Berita(
              id_berita: i["id_berita"],
              judul: i["judul"],
              sub_title: i["sub_title"],
              dekripsi: i["dekripsi"]);

          //Adding user to the list.
          news.add(brt);
        }
        return news;
      } else {
        throw Exception("failed");
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }
}

class Berita {
  final String id_berita;
  final String judul;
  final String sub_title;
  final String dekripsi;

  Berita({
    required this.id_berita,
    required this.judul,
    required this.sub_title,
    required this.dekripsi,
  });
}
