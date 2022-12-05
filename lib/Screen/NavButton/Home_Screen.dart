import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kepuharjo_app/Controller/login_controller.dart';
import 'package:kepuharjo_app/Screen/Home/appearance_home.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/appearance_pengajuan.dart';
import 'package:kepuharjo_app/Screen/Profil/appearance_profil.dart';
import 'package:kepuharjo_app/Screen/Status/appearance_status.dart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

CurrentUser _rememberCurrentUser = Get.put(CurrentUser());

List<Widget> screen = <Widget>[
  const AppearanceHome(),
  const AppearancePengajuan(),
  const AppearanceStatus(),
  const AppearanceProfil(),
];

RxInt _index = 0.obs;

List _navbutton = [
  {
    "active_icon": Icons.house,
    "non_active_icon": Icons.house_outlined,
    "label": "Home"
  },
  {
    "active_icon": Icons.mail,
    "non_active_icon": Icons.mail_outlined,
    "label": "Home"
  },
  {
    "active_icon": Icons.assignment,
    "non_active_icon": Icons.assignment_outlined,
    "label": "Home"
  },
  {
    "active_icon": Icons.person,
    "non_active_icon": Icons.person_outlined,
    "label": "Home"
  }
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentUser(),
      initState: (CurrentUser) {
        _rememberCurrentUser.getUserInfo();
      },
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
              child: Obx(
            () => screen[_index.value],
          )),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
              currentIndex: _index.value,
              onTap: (value) {
                _index.value = value;
              },
              showSelectedLabels: true,
              showUnselectedLabels: false,
              selectedItemColor: Color(0xFF2A2A72),
              unselectedItemColor: Color(0xFF2A2A72),
              items: List.generate(4, (index) {
                var navBtn = _navbutton[index];
                return BottomNavigationBarItem(
                    icon: Icon(navBtn["non_active_icon"]),
                    activeIcon: Icon(navBtn["active_icon"]),
                    label: navBtn["label"]);
              }))),
        );
      },
    );
  }
}
