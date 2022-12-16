import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Controller/Current_UserLogin.dart';
import 'package:kepuharjo_app/Screen/Profil/widget_option_setting.dart';
import 'package:kepuharjo_app/Screen/Profil/widget_profil.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class AppearanceProfil extends StatefulWidget {
  // final User user;
  const AppearanceProfil({Key key}) : super(key: key);

  @override
  State<AppearanceProfil> createState() => _AppearanceProfilState();
}

CurrentUser rememberCurrentUser = Get.put(CurrentUser());
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class _AppearanceProfilState extends State<AppearanceProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'Profil',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
            decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          image: const DecorationImage(
            image: AssetImage('images/newbgsa.png'),
            fit: BoxFit.cover,
          ),
          color: appColor,
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              WidgetShowProfile(),
              WidgetOptionsSetting(),
            ],
          ),
        ),
      ),
    );
  }
}
