import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Controller/login_controller.dart';
import 'package:kepuharjo_app/Model/RememberUser.dart';
import 'package:kepuharjo_app/Model/User_Model.dart';
import 'package:kepuharjo_app/Screen/Profil/Detail_Profil/detail_profile.dart';
import 'package:kepuharjo_app/Shared/shared.dart';
import 'package:http/http.dart' as http;

class WidgetShowProfile extends StatefulWidget {
  WidgetShowProfile({Key key});

  @override
  State<WidgetShowProfile> createState() => _WidgetShowProfileState();
}

final CurrentUser _currentUser = Get.put(CurrentUser());

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
                    image: AssetImage("images/user.png"),
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
                      color: Color(0xFF2A2A72),
                    ),
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
            children: <Widget>[
              // Text(widget.idAkun),
              Text(
                _currentUser.user.namaLengkap,
                style: boldTextStyle.copyWith(fontSize: 18, color: blackColor),
              ),
              Text(
                "Nik : " + _currentUser.user.idAkun,
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
            padding: const EdgeInsets.symmetric(horizontal: 50),
            height: 45,
            decoration: BoxDecoration(
              color: Color(0xFF2A2A72),
              borderRadius: BorderRadius.circular(25),
            ),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailProfil()));
                },
                child: Text(
                  'Edit Profil',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
