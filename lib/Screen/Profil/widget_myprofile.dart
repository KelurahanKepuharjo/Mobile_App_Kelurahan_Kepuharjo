import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/Profil/Detail_Profil/detail_profile.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetMyProfil extends StatefulWidget {
  const WidgetMyProfil({Key key}) : super(key: key);

  @override
  State<WidgetMyProfil> createState() => _WidgetMyProfilState();
}

Padding getProfil(String img, String nama, String nik) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Row(
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              img,
            ),
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

class _WidgetMyProfilState extends State<WidgetMyProfil> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailProfil()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
            getProfil(
                "images/profile.jpeg", "Achmad Fawaid", "3509212504030001"),
            Divider(
              color: whiteColor,
              height: 0,
              thickness: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                "Lihat Profil Saya",
                style: boldTextStyle.copyWith(fontSize: 12, color: whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
