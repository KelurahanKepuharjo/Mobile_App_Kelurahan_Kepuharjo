import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/Pengajuan.dart';

import 'package:kepuharjo_app/Shared/shared.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  void onTap(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  Container buildCardMsg(
    String title,
  ) {
    return Container(
      height: 130,
      width: 130,
      child: Card(
        margin: EdgeInsets.all(5),
        color: Color.fromARGB(217, 255, 255, 255),
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage(
            //       "images/ltr.png",
            //     ),
            //     fit: BoxFit.contain,
            //     alignment: Alignment.topCenter,
            //   ),
            // ),
            // child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  "images/ltr.png",
                  height: 60,
                  width: 60,
                  alignment: Alignment.topCenter,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: whiteTextStyle.copyWith(
                      fontSize: 12,
                      color: blackColor,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
            // ),
          ),
        ),
      ),
    );
  }

  GestureDetector getLetter(String title, int index, String img) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Pengajuannich()));
          //1.item
        }
        if (index == 1) {
          //2.item
        }
        if (index == 2) {
          //3.item
        }
        if (index == 3) {
          //4.item
        }
        if (index == 4) {
          //5.item
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        height: 130,
        width: 130,
        decoration: index == 0 || index == 2 || index == 4
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 239, 239, 239),
                // boxShadow: const [
                //   BoxShadow(
                //     color: Colors.grey,
                //     blurRadius: 1,
                //     offset: Offset(1, 1),
                //   )
                // ],
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 239, 239, 239),
                // boxShadow: const [
                //   BoxShadow(
                //     color: Colors.grey,
                //     blurRadius: 1,
                //     offset: Offset(1, 1),
                //   )
                // ],
              ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                img,
                height: 50,
                width: 50,
                alignment: Alignment.topCenter,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: blackColor,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector getNews(String title, int index, String subtitle) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          //1.item
        }
        if (index == 1) {
          //2.item
        }
        if (index == 2) {
          //3.item
        }
        if (index == 3) {
          //4.item
        }
        if (index == 4) {
          //5.item
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: index == 0 || index == 2 || index == 4
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 239, 239, 239),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 239, 239, 239),
              ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.start,
              style: boldTextStyle.copyWith(
                  fontSize: 20, color: blackColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.start,
              style: whiteTextStyle.copyWith(
                  fontSize: 13,
                  color: blackColor,
                  fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }

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
                margin: EdgeInsets.only(right: 20, top: 20, left: 20),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 255,
                    ),
                    Container(
                      height: 80,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage('images/lambange.png'))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Kepuharjo App",
                  style:
                      boldTextStyle.copyWith(fontSize: 26, color: whiteColor),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Smart Aplikasi Pelayanan Pengajuan\nSurat Kelurahan Kepuharjo",
                  style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: whiteColor),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Jl.Langsep no.18, Kecamatan Lumajang, Kabupaten Lumajang",
                  style: whiteTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: whiteColor),
                ),
              ),
            ])),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Text(
                        "Pelayanan Masyarakat",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: greenColor,
                            fontWeight: FontWeight.w500),
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
                                    builder: (context) => Pengajuannich()));
                          },
                          child: Text(
                            "See All",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Color(0xFF053D00),
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xffCDF49A)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Listletter
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      getLetter("Surat Keterangan Tidak Mampu", 0,
                          "images/email3.png"),
                      getLetter(
                          "Surat Keterangan Kematian", 1, "images/email3.png"),
                      getLetter(
                          "Surat Keterangan Bepergian", 2, "images/email3.png"),
                      getLetter(
                          "Surat Keterangan Domisili", 3, "images/email3.png"),
                      getLetter(
                          "Surat Keterangan Identitas", 4, "images/email3.png"),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(
                        "Berita Terkini",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: greenColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              //listberitaterkini
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 0, right: 10),
                  child: Column(
                    children: [
                      getNews("Berita", 0, "Yagatau gua"),
                      getNews("Berita", 1, "Kamu Nanyeak"),
                      getNews("Berita", 2, "Apaan tuh"),
                      getNews("Berita", 3, "Affah iyyah"),
                      getNews("Berita", 4, "Begini kids?"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
