import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Controller/Current_UserLogin.dart';
import 'package:kepuharjo_app/Controller/RememberUser.dart';
import 'package:kepuharjo_app/Screen/Login/appearance_login.dart';
import 'package:kepuharjo_app/Screen/NavButton/Home_Screen.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class DetailProfil extends StatefulWidget {
  const DetailProfil({Key key}) : super(key: key);

  @override
  State<DetailProfil> createState() => _DetailProfilState();
}

class _DetailProfilState extends State<DetailProfil> {
  final CurrentUser _currentUser = Get.put(CurrentUser());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 35, 35, 95),
                appColor,
                Color.fromARGB(255, 51, 51, 148),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
          // color: const appColor,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 70),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: whiteColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showLogoutDialog();
                        },
                        child: Icon(
                          Icons.logout_outlined,
                          color: whiteColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Detail Profil',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  // const SizedBox(
                  //   height: 1,
                  // ),
                  SizedBox(
                    height: height * 0.30,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              height: innerHeight * 0.5,
                              width: innerWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    _currentUser.user.namaLengkap,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Divider(
                                    color: blackColor,
                                  ),
                                  Text(
                                    _currentUser.user.idAkun,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.grey.shade300,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: appColor,
                                  child: Text(
                                    _currentUser.user.namaLengkap[0]
                                        .toUpperCase(),
                                    style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: height * 0.60,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 2),
                          getProfile(Icons.person_pin, "NIK",
                              _currentUser.user.idAkun),
                          const SizedBox(height: 5),
                          getProfile(Icons.person, "Nama Lengkap",
                              _currentUser.user.namaLengkap),
                          const SizedBox(height: 5),
                          getProfile(
                              Icons.call, "No.Telepon", _currentUser.user.noHp),
                          const SizedBox(
                            height: 5,
                          ),
                          getProfile(Icons.house_rounded, "RT",
                              "00${_currentUser.user.rT}"),
                          const SizedBox(
                            height: 5,
                          ),
                          getProfile(Icons.house_rounded, "RW",
                              "00${_currentUser.user.rW}"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logOut();
  }

  Container getProfile(IconData icon, String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(179, 234, 234, 234),
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: appColor.withOpacity(0.1),
          ),
          child: Icon(
            icon,
            color: appColor,
          ),
        ),
        title: Text(title,
            style: poppinsMediumBlack.copyWith(
                fontWeight: FontWeight.bold, fontSize: 15)),
        subtitle: Text(
          subtitle,
          style: poppinsMediumBlack,
        ),
      ),
    );
  }

  void logOut() {
    RememberUser.removeUserSessions();
  }

  FutureOr onGoback(dynamic value) {
    logOut();
  }

  void logOutremove() {
    Route route = MaterialPageRoute(builder: (_) => const AppeareaceLogin());
    Navigator.pushAndRemoveUntil(
        context, route, (Route<dynamic> route) => false).then(onGoback);
  }

  showLogoutDialog() {
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.WARNING,
      title: 'Warning!',
      titleTextStyle: poppinsLargeBlack.copyWith(
          fontSize: 25, fontWeight: FontWeight.bold, color: appColor),
      desc: 'Apakah anda yakin, untuk logout?',
      descTextStyle: nunitoMediumBlack.copyWith(color: Colors.grey),
      btnOkOnPress: () {
        setState(() {
          logOutremove();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const AppeareaceLogin()),
              (Route<dynamic> route) => false);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
              content: AwesomeSnackbarContent(
                  title: "Berhasil",
                  message: "Anda berhasil Logout",
                  contentType: ContentType.success)));
        });
      },
      btnOkIcon: Icons.done,
      btnCancelIcon: Icons.close,
      btnCancelOnPress: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      },
    ).show();
  }
}
