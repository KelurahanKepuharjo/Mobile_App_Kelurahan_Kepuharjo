import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Comm/getTextForm.dart';
import 'package:kepuharjo_app/Controller/Current_UserLogin.dart';
import 'package:kepuharjo_app/Controller/RememberUser.dart';
import 'package:kepuharjo_app/Model/User_Model.dart';
import 'package:kepuharjo_app/Screen/Login/appearance_login.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_tidak_mampu.dart';
import 'package:kepuharjo_app/Shared/shared.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class WidgetDataDetailProfil extends StatefulWidget {
  const WidgetDataDetailProfil({Key key}) : super(key: key);

  @override
  State<WidgetDataDetailProfil> createState() => _WidgetDataDetailProfilState();
}

class _WidgetDataDetailProfilState extends State<WidgetDataDetailProfil> {
  DateFormat dateFormat;
  File image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('id');
  }

  Future getImageGalerry() async {
    final ImagePicker picker = ImagePicker();
    final XFile imagePicked =
        await picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked.path);
    setState(() {});
  }

  Future getImageCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile imagePicked =
        await picker.pickImage(source: ImageSource.camera);
    image = File(imagePicked.path);
    setState(() {});
  }

  final CurrentUser _currentUser = Get.put(CurrentUser());

  Future _modalBottomSheet() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: 200,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: greyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    onTap: () async {
                      await getImageGalerry();
                    },
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFF2A2A72).withOpacity(0.1),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Color(0xFF2A2A72),
                      ),
                    ),
                    title: Text("Upload dari Galeri",
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
                  ),
                  ListTile(
                    onTap: () async {
                      await getImageCamera();
                    },
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFF2A2A72).withOpacity(0.1),
                      ),
                      child: const Icon(
                        Icons.image,
                        color: Color(0xFF2A2A72),
                      ),
                    ),
                    title: Text("Upload dari Kamera",
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container getProfile(IconData icon, String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(179, 234, 234, 234),
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color(0xFF2A2A72).withOpacity(0.1),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF2A2A72),
          ),
        ),
        title: Text(title,
            style: poppinsMediumBlack.copyWith(
                fontWeight: FontWeight.bold, fontSize: 15)),
        subtitle: Text(
          subtitle,
          style: poppinsMediumBlack,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              image == null
                  ? SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset("images/user.png")),
                    )
                  : SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(image)),
                    ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFF2A2A72),
                    ),
                    child: InkWell(
                      onTap: () {
                        _modalBottomSheet();
                      },
                      child: Icon(
                        Icons.photo_camera,
                        color: whiteColor,
                        size: 20,
                      ),
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 20),
          getProfile(Icons.person_pin, "NIK", _currentUser.user.idAkun),
          const SizedBox(height: 5),
          getProfile(
              Icons.person, "Nama Lengkap", _currentUser.user.namaLengkap),
          const SizedBox(height: 5),
          getProfile(Icons.call, "No.Telepon", _currentUser.user.noHp),
          const SizedBox(
            height: 5,
          ),
          getProfile(Icons.house_rounded, "RT", _currentUser.user.rT),
          const SizedBox(
            height: 5,
          ),
          getProfile(Icons.house_rounded, "RW", _currentUser.user.rW),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 45,
                width: 250,
                decoration: BoxDecoration(
                  color: Color(0xFF2A2A72),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        )),
                    onPressed: showSuccessDialog,
                    child: Text(
                      'Simpan',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          TextButton(
              onPressed: () {
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
              },
              child: Text("Log Out",
                  style: poppinsMediumBlack.copyWith(
                      color: Color(0xFF2A2A72), fontWeight: FontWeight.bold)))
        ],
      ),
    );
  }

  showSuccessDialog() {
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.SUCCES,
      title: 'Berhasil!',
      titleTextStyle: GoogleFonts.poppins(
          fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF2A2A72)),
      desc: 'Data berhasil disimpan',
      descTextStyle: GoogleFonts.nunito(fontSize: 14, color: Colors.grey),
      btnOkOnPress: () {
        Navigator.pop(context);
      },
    ).show();
  }
}
