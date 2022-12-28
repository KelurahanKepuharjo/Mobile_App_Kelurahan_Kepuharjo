import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Controller/Current_UserLogin.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetHeaders extends StatefulWidget {
  const WidgetHeaders({Key key}) : super(key: key);

  @override
  State<WidgetHeaders> createState() => _WidgetProfileState();
}

class _WidgetProfileState extends State<WidgetHeaders> {
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

  String lokasi = "Kelurahan Kepuharjo";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 140,
          width: size.width,
          child: Swiper(
            itemCount: 2,
            autoplay: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  if (index == 0) {
                    final intent = AndroidIntent(
                        action: 'action_view',
                        data: Uri.encodeFull(
                            'google.navigation:q=${lokasi.trim()}'),
                        package: 'com.google.android.apps.maps');
                    await intent.launch();
                  }
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                  padding: const EdgeInsets.all(10),
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff102286),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              (index == 0)
                                  ? "images/location.png"
                                  : "images/office.png",
                              height: 50,
                            ),
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
                        ),
                      ),
                      Image.asset(
                        "images/mylogo.png",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
