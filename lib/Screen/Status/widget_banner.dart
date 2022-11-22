import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetBanner extends StatefulWidget {
  const WidgetBanner({Key key}) : super(key: key);

  @override
  State<WidgetBanner> createState() => _WidgetBannerState();
}

Container getPengajuan(
    BuildContext context, String img, String nama, String surat, int index) {
  return Container(
    padding: const EdgeInsets.all(15),
    height: 100,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: const Color(0xFFF4F4F4),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nama,
              style: boldTextStyle.copyWith(fontSize: 16, color: blackColor),
            ),
            Text(
              surat,
              style: GoogleFonts.poppins(
                  fontSize: 12, color: blackColor, fontWeight: FontWeight.w300),
            ),
          ],
        ),
        SizedBox(
          height: 50,
          width: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              img,
            ),
          ),
        ),
      ],
    ),
  );
}

class _WidgetBannerState extends State<WidgetBanner> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          getPengajuan(context, "images/profile.jpeg", "Achmad Fawa'id",
              "Surat Keterangan Belum Menikah", 0)
        ],
      ),
    );
  }
}
