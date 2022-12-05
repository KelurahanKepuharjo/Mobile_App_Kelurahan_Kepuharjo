import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Model/RememberUser.dart';
import 'package:kepuharjo_app/Screen/Home/appearance_home.dart';
import 'package:kepuharjo_app/Screen/Login/appearance_login.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/appearance_pengajuan.dart';
import 'package:kepuharjo_app/Screen/Profil/appearance_profil.dart';
import 'package:kepuharjo_app/Screen/Status/appearance_status.dart.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  static final List<Widget> screen = <Widget>[
    const AppearanceHome(),
    const AppearancePengajuan(),
    const AppearanceStatus(),
    const AppearanceProfil(),
  ];
  void onTap(int index) {
    setState(() {
      currentTab = index;
      // currentScreen = HomePage();
    });
  }

  final PageStorageBucket bucket = PageStorageBucket();
  // Widget currentScreen = HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: PageStorage(bucket: bucket, child: screen.elementAt(currentTab)),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
            iconSize: 30,
            selectedLabelStyle:
                poppinsSmallBlack.copyWith(fontWeight: FontWeight.w300),
            selectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            onTap: onTap,
            currentIndex: currentTab,
            selectedItemColor: Color(0xFF2A2A72),
            unselectedItemColor: Color(0xFF2A2A72),
            showSelectedLabels: true,
            showUnselectedLabels: false,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.house_outlined),
                  activeIcon: Icon(Icons.house_rounded)),
              BottomNavigationBarItem(
                  label: "Pengajuan",
                  icon: Icon(Icons.mail_outline),
                  activeIcon: Icon(Icons.mail)),
              BottomNavigationBarItem(
                  label: "Status",
                  icon: Icon(Icons.assignment_outlined),
                  activeIcon: Icon(Icons.assignment)),
              BottomNavigationBarItem(
                  label: "Profil",
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person)),
            ]),
      ),
    );
  }
}
