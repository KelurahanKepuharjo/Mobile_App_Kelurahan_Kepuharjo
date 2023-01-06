import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kepuharjo_app/Controller/Current_UserLogin.dart';
import 'package:kepuharjo_app/OrderStatus.dart';
import 'package:kepuharjo_app/Screen/Home/appearance_home.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/appearance_pengajuan.dart';
import 'package:kepuharjo_app/Screen/Profil/appearance_profil.dart';
import 'package:kepuharjo_app/Screen/Status/appearance_status.dart.dart';
import 'package:kepuharjo_app/Shared/shared.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final orderStatus = OrderStatus();
final userlogin = CurrentUser();

List<Widget> screen = <Widget>[
  const AppearanceHome(),
  const AppearancePengajuan(),
  const AppearanceStatus(),
];

int _index = 0;

List _navbutton = [
  {
    "active_icon": Icons.house,
    "non_active_icon": Icons.house_outlined,
    "label": "Home"
  },
  {
    "active_icon": Icons.space_dashboard_rounded,
    "non_active_icon": Icons.space_dashboard_outlined,
    "label": "Pengajuan"
  },
  {
    "active_icon": Icons.assignment,
    "non_active_icon": Icons.assignment_outlined,
    "label": "Status"
  },
];

class _HomeScreenState extends State<HomeScreen> {
  void onTap(value) {
    setState(() {
      _index = value;
    });
  }

  @override
  void initState() {
    super.initState();
    userlogin.getUserInfo();
    orderStatus.setUserId(userlogin.user.idAkun);
    orderStatus.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: onTap,
          backgroundColor: Colors.white,
          showSelectedLabels: true,
          unselectedLabelStyle:
              poppinsSmallBlack.copyWith(fontWeight: FontWeight.w300),
          selectedLabelStyle:
              poppinsSmallBlack.copyWith(fontWeight: FontWeight.w300),
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: appColor,
          unselectedItemColor: appColor,
          items: List.generate(3, (index) {
            var navBtn = _navbutton[index];
            return BottomNavigationBarItem(
                icon: Icon(navBtn["non_active_icon"]),
                activeIcon: Icon(navBtn["active_icon"]),
                label: navBtn["label"]);
          })),
    );
  }
}
