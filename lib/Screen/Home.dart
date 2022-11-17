import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Screen/Home/appearance_home.dart';
import 'package:kepuharjo_app/Screen/HomePage.dart';
import 'package:kepuharjo_app/Screen/Pengajuan.dart';
import 'package:kepuharjo_app/Screen/Profile.dart';
import 'package:kepuharjo_app/Screen/Status.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  static final List<Widget> screen = <Widget>[
    AppearanceHome(),
    Pengajuannich(),
    Status(),
    Profile()
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
      body: PageStorage(bucket: bucket, child: screen.elementAt(currentTab)),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          selectedFontSize: 12,
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: onTap,
          currentIndex: currentTab,
          selectedItemColor: midGreen,
          unselectedItemColor: midGreen,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home)),
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
    );
  }
}
