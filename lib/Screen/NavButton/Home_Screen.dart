import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kepuharjo_app/Controller/Current_UserLogin.dart';
import 'package:kepuharjo_app/Screen/Home/appearance_home.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/appearance_pengajuan.dart';
import 'package:kepuharjo_app/Screen/Profil/appearance_profil.dart';
import 'package:kepuharjo_app/Screen/Status/appearance_status.dart.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

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
    "label": "Pengajuan"
  },
  {
    "active_icon": Icons.assignment,
    "non_active_icon": Icons.assignment_outlined,
    "label": "Status"
  },
  {
    "active_icon": Icons.person,
    "non_active_icon": Icons.person_outlined,
    "label": "Profil"
  }
];

class _HomeScreenState extends State<HomeScreen> {
  void onTap(value) {
    setState(() {
      _index.value = value;
      currentScreen = const AppearanceHome();
    });
  }

  Widget currentScreen = const AppearanceHome();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentUser(),
      initState: (CurrentUser) {
        _rememberCurrentUser.getUserInfo();
      },
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () => screen[_index.value],
          ),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
              currentIndex: _index.value,
              onTap: onTap,
              backgroundColor: Colors.white,
              showSelectedLabels: true,
              selectedLabelStyle:
                  poppinsSmallBlack.copyWith(fontWeight: FontWeight.w300),
              selectedFontSize: 12,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              selectedItemColor: appColor,
              unselectedItemColor: appColor,
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
