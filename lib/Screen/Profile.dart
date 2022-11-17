import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/Home.dart';
import 'package:kepuharjo_app/Screen/Login/appearance_login.dart';
import 'package:kepuharjo_app/Screen2/Profile_Screen/daftar_keluarga.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

Padding getProfil(String img, String nama, String nik) {
  return Padding(
    padding: EdgeInsets.all(15),
    child: Row(
      children: [
        ClipRRect(
          child: Image.asset(
            img,
            height: 50,
            width: 50,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nama,
              style: boldTextStyle.copyWith(fontSize: 16, color: whiteColor),
            ),
            Text(
              nik,
              style: GoogleFonts.poppins(
                  fontSize: 14, color: whiteColor, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ],
    ),
  );
}

GestureDetector buildAccountOptionRow(
    BuildContext context, String title, int index) {
  return GestureDetector(
    onTap: () {
      if (index == 0) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Keluarga(
                    // value: data![index]["id"],
                    )));
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
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF454444),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFFCCCCCC),
            size: 15,
          ),
        ],
      ),
    ),
  );
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Icon(Icons.keyboard_arrow_left),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          '  Profil',
          style: whiteTextStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
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
      body: SafeArea(
        child: Container(
          color: whiteColor,
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 115,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF2BAE82),
                        Color.fromARGB(255, 81, 195, 159),
                      ],
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        offset: Offset(1, 1),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      getProfil("images/email3.png", "Achmad Fawaid",
                          "3509212504030001"),
                      Divider(
                        color: whiteColor,
                        height: 0,
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        // padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "Lihat Profil Saya",
                          style: boldTextStyle.copyWith(
                              fontSize: 12, color: whiteColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFF8F8F8)),
                child: Column(
                  children: [
                    buildAccountOptionRow(context, "Daftar Keluarga", 0),
                    Divider(
                      color: Color(0xFFE8E8E8),
                      height: 10,
                      thickness: 1,
                    ),
                    buildAccountOptionRow(context, "Kewarganegaraan", 1),
                    Divider(
                      color: Color(0xFFE8E8E8),
                      height: 10,
                      thickness: 1,
                    ),
                    buildAccountOptionRow(context, "Pusat Bantuan", 2),
                    Divider(
                      color: Color(0xFFE8E8E8),
                      height: 10,
                      thickness: 1,
                    ),
                    buildAccountOptionRow(context, "Tentang", 3),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Versi Aplikasi : 1.0",
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "Pengembangan Versi : 123",
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            )),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AppeareaceLogin()),
                              (Route<dynamic> route) => false);
                        },
                        child: Text(
                          'Log Out',
                          style: boldTextStyle.copyWith(
                              fontSize: 18, color: Colors.white),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
