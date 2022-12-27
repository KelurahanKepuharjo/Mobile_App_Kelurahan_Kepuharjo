import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Controller/Current_UserLogin.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetProfile extends StatefulWidget {
  const WidgetProfile({Key key}) : super(key: key);

  @override
  State<WidgetProfile> createState() => _WidgetProfileState();
}

class _WidgetProfileState extends State<WidgetProfile> {
  final pageCtrl =
      PageController(initialPage: 0, viewportFraction: 0.8, keepPage: true);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageCtrl;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 150,
          width: size.width,
          child: Swiper(
            itemCount: 2,
            autoplay: true,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                padding: const EdgeInsets.all(15),
                height: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff102286),
                    image: const DecorationImage(
                        image: AssetImage('images/newbgsa.png'),
                        fit: BoxFit.cover,
                        opacity: 0.9,
                        alignment: Alignment.center)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          (index == 0)
                              ? "images/location.png"
                              : "images/office.png",
                          height: 50,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (index == 0)
                              ? "Lokasi Kelurahan"
                              : "Profile Kelurahan",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: whiteColor),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
