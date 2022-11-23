import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Screen/Login/appearance_login.dart';

import 'package:kepuharjo_app/Screen/Profil/Detail_Keluarga/daftar_keluarga.dart';
import 'package:kepuharjo_app/Screen/Profil/Info_Aplikasi/appearance_app.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetOptionsSetting extends StatefulWidget {
  const WidgetOptionsSetting({Key key}) : super(key: key);

  @override
  State<WidgetOptionsSetting> createState() => _WidgetOptionsSettingState();
}

Padding buildSettingKewarganegaraan(
    BuildContext context, String title, String kwn) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF454444),
          ),
        ),
        Text(
          kwn,
          style: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color(0xFF454444),
          ),
        )
      ],
    ),
  );
}

ListTile profileMenuWidget(BuildContext context, String title, IconData icon,
    bool endIcon, int index, Color textColor) {
  return ListTile(
    onTap: () {
      if (index == 0) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DaftarKeluarga()));
      }
      if (index == 1) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const InfoAplikasi()));
      }
      if (index == 2) {}
      if (index == 3) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const AppeareaceLogin()),
            (Route<dynamic> route) => false);
      }
    },
    leading: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: greenColor.withOpacity(0.1),
      ),
      child: Icon(icon, color: greenColor),
    ),
    title: Text(title,
        style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          // color: Color(0xFF454444),
        ).apply(color: textColor)),
    trailing: endIcon
        ? Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey.shade200,
            ),
            child: Icon(
              Icons.arrow_forward_ios,
              color: blackColor,
              size: 15,
            ),
          )
        : null,
  );
}

GestureDetector buildSettingOptionRow(
    BuildContext context, String title, int index) {
  // final ChangeThemes ctrl = Get.find();
  return GestureDetector(
    onTap: () {
      if (index == 0) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DaftarKeluarga()));
      }
      if (index == 1) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const InfoAplikasi()));
      }
      if (index == 2) {
        //3.item
      }
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF454444),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFFCCCCCC),
            size: 15,
          ),
        ],
      ),
    ),
  );
}

class _WidgetOptionsSettingState extends State<WidgetOptionsSetting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          profileMenuWidget(context, "Lokasi Kelurahan", Icons.person, true, 0,
              const Color(0xFF454444)),
          profileMenuWidget(context, "Info Aplikasi", Icons.info, true, 1,
              const Color(0xFF454444)),
          profileMenuWidget(
              context, "Tentang", Icons.help, true, 2, const Color(0xFF454444)),
          profileMenuWidget(
              context, "Log Out", Icons.logout, false, 3, Colors.red)
        ],
      ),
    );
    // return Container(
    //   margin: const EdgeInsets.fromLTRB(15, 0, 15, 50),
    //   padding: const EdgeInsets.all(10),
    //   decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(15), color: Color(0xFFF8F8F8)),
    //   child: Column(
    //     children: [
    //       buildSettingOptionRow(context, "Daftar Keluarga", 0),
    //       const Divider(
    //         color: Color(0xFFE8E8E8),
    //         height: 10,
    //         thickness: 1,
    //       ),
    //       buildSettingKewarganegaraan(context, "Kewarganegaraan", "Indonesia"),
    //       const Divider(
    //         color: Color(0xFFE8E8E8),
    //         height: 10,
    //         thickness: 1,
    //       ),
    //       buildSettingOptionRow(context, "Info Aplikasi", 1),
    //       const Divider(
    //         color: Color(0xFFE8E8E8),
    //         height: 10,
    //         thickness: 1,
    //       ),
    //       buildSettingOptionRow(context, "Log Out", 2),
    //     ],
    //   ),
    // );
  }
}
