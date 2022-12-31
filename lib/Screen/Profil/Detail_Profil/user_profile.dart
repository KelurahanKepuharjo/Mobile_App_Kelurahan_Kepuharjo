import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Controller/Current_UserLogin.dart';
import 'package:kepuharjo_app/Controller/RememberUser.dart';
import 'package:kepuharjo_app/Screen/Login/appearance_login.dart';
import 'package:kepuharjo_app/Screen/NavButton/Home_Screen.dart';
import 'package:kepuharjo_app/Screen/Profil/Info_Aplikasi/appearance_app.dart';
import 'package:kepuharjo_app/Screen/Profil/Tentang/appearance_tentang.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({Key key}) : super(key: key);

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  void selectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const InfoAplikasi()));
        break;

      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AppearanceTentang()),
        );
        break;
    }
  }

  final CurrentUser _currentUser = CurrentUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.keyboard_arrow_left),
          ),
        ),
        backgroundColor: appColor,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Detail Profil',
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Theme(
              data: Theme.of(context).copyWith(
                  textTheme: TextTheme().apply(bodyColor: Colors.black),
                  dividerColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.white)),
              child: PopupMenuButton<int>(
                color: Colors.white,
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                      value: 0,
                      child: Row(
                        children: [
                          Icon(
                            Icons.info,
                            color: appColor,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Info Aplikasi",
                            style: poppinsMediumBlack,
                          )
                        ],
                      )),
                  PopupMenuItem<int>(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.help,
                            color: appColor,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Tentang",
                            style: poppinsMediumBlack,
                          )
                        ],
                      )),
                ],
                onSelected: (item) => selectedItem(context, item),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
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
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: blackColor,
                            ),
                            Text(
                              _currentUser.user.idAkun,
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
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
                              _currentUser.user.namaLengkap[0].toUpperCase(),
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 520,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25), color: whiteColor),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      getProfile(
                          Icons.person_pin, "NIK", _currentUser.user.idAkun),
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
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          showLogoutDialog();
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: appColor),
                              color: appColor.withOpacity(0.1)),
                          child: Center(
                            child: Text(
                              "LogOut",
                              textAlign: TextAlign.center,
                              style:
                                  poppinsMediumBlack.copyWith(color: appColor),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "@S-Kepuharjo",
                              style: poppinsSmallBlack.copyWith(
                                  color: blackColor.withOpacity(0.5)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
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
          logOut();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const AppeareaceLogin()),
          );
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
              builder: (context) => const HomeScreen(),
            ));
      },
    ).show();
  }
}
