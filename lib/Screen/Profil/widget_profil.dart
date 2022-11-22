import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/Profil/Detail_Profil/detail_profile.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetShowProfile extends StatefulWidget {
  const WidgetShowProfile({Key key}) : super(key: key);

  @override
  State<WidgetShowProfile> createState() => _WidgetShowProfileState();
}

class _WidgetShowProfileState extends State<WidgetShowProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: const Image(
                    image: AssetImage("images/profile.jpeg"),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: greenColor),
                    child: Icon(
                      Icons.mode_edit,
                      color: whiteColor,
                      size: 20,
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Achmad Fawaid",
                style: boldTextStyle.copyWith(fontSize: 18, color: blackColor),
              ),
              Text(
                "3509212504030002",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: blackColor,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF2BAE82),
                  Color.fromARGB(255, 81, 195, 159),
                ],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailProfil()));
                },
                child: Text(
                  'Lihat Profil Saya',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }
}
