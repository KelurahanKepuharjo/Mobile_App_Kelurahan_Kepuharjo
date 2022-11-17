import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetOptionsSetting extends StatefulWidget {
  const WidgetOptionsSetting({Key key}) : super(key: key);

  @override
  State<WidgetOptionsSetting> createState() => _WidgetOptionsSettingState();
}

GestureDetector buildSettingOptionRow(
    BuildContext context, String title, int index) {
  return GestureDetector(
    onTap: () {
      if (index == 0) {
        //1.item
      }
      if (index == 1) {
        //2.item
      }
      if (index == 2) {
        //3.item
      }
      if (index == 3) {
        //4.item
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
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xFFF8F8F8)),
      child: Column(
        children: [
          buildSettingOptionRow(context, "Daftar Keluarga", 0),
          const Divider(
            color: Color(0xFFE8E8E8),
            height: 10,
            thickness: 1,
          ),
          buildSettingOptionRow(context, "Kewarganegaraan", 1),
          const Divider(
            color: Color(0xFFE8E8E8),
            height: 10,
            thickness: 1,
          ),
          buildSettingOptionRow(context, "Pusat Bantuan", 2),
          const Divider(
            color: Color(0xFFE8E8E8),
            height: 10,
            thickness: 1,
          ),
          buildSettingOptionRow(context, "Tentang", 3),
        ],
      ),
    );
  }
}
