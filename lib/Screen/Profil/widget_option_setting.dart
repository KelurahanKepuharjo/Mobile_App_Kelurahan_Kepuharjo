import 'package:android_intent_plus/android_intent.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Controller/RememberUser.dart';
import 'package:kepuharjo_app/Screen/Login/appearance_login.dart';
import 'package:kepuharjo_app/Screen/Profil/Info_Aplikasi/appearance_app.dart';
import 'package:kepuharjo_app/Screen/Profil/Tentang/appearance_tentang.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetOptionsSetting extends StatefulWidget {
  const WidgetOptionsSetting({Key key}) : super(key: key);

  @override
  State<WidgetOptionsSetting> createState() => _WidgetOptionsSettingState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class _WidgetOptionsSettingState extends State<WidgetOptionsSetting> {
  ListTile profileMenuWidget(
      String title, IconData icon, bool endIcon, int index, Color textColor) {
    return ListTile(
      onTap: () async {
        // if (index == 0) {}
        if (index == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const InfoAplikasi()));
        }
        if (index == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AppearanceTentang()));
        }
        if (index == 3) {
          showSuccessDialog();
        }
      },
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color(0xFF2A2A72).withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: Color(0xFF2A2A72),
        ),
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

  showSuccessDialog() {
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.WARNING,
      title: 'Warning!',
      titleTextStyle: poppinsLargeBlack.copyWith(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF2A2A72)),
      desc: 'Apakah anda yakin, untuk logout?',
      descTextStyle: nunitoMediumBlack.copyWith(color: Colors.grey),
      btnOkOnPress: () {
        if (_formkey.currentState.validate()) {
          setState(() {
            RememberUser.removeUserSessions().then((value) =>
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AppeareaceLogin())));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                behavior: SnackBarBehavior.floating,
                content: AwesomeSnackbarContent(
                    title: "Berhasil",
                    message: "Anda berhasil Logout",
                    contentType: ContentType.success)));
          });
        }
      },
      btnOkIcon: Icons.done,
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            const Lokasi(),
            profileMenuWidget(
                "Info Aplikasi", Icons.info, true, 1, const Color(0xFF454444)),
            profileMenuWidget(
                "Tentang", Icons.help, true, 2, const Color(0xFF454444)),
            profileMenuWidget("Log Out", Icons.logout, false, 3, Colors.red)
          ],
        ),
      ),
    );
  }
}

class Lokasi extends StatefulWidget {
  const Lokasi({Key key}) : super(key: key);

  @override
  State<Lokasi> createState() => _LokasiState();
}

class _LokasiState extends State<Lokasi> {
  String lokasi = "Kelurahan Kepuharjo";
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        final intent = AndroidIntent(
            action: 'action_view',
            data: Uri.encodeFull('google.navigation:q=${lokasi.trim()}'),
            package: 'com.google.android.apps.maps');
        await intent.launch();
      },
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color(0xFF2A2A72).withOpacity(0.1),
        ),
        child: const Icon(
          Icons.location_on,
          color: Color(0xFF2A2A72),
        ),
      ),
      title: Text("Lokasi Kelurahan",
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xFF454444),
          )),
      trailing: Container(
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
      ),
    );
  }
}
