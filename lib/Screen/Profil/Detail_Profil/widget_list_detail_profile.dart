import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Comm/getTextForm.dart';
import 'package:kepuharjo_app/Controller/Current_UserLogin.dart';
import 'package:kepuharjo_app/Model/RememberUser.dart';
import 'package:kepuharjo_app/Model/User_Model.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_tidakmampu.dart';
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
                      child: Icon(
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
                      child: Icon(
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
          Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xFF2A2A72).withOpacity(0.1),
                ),
                child: const Icon(
                  Icons.person_pin,
                  color: Color(0xFF2A2A72),
                ),
              ),
              title: Text("NIK",
                  style: poppinsMediumBlack.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 15)),
              subtitle: Text(
                _currentUser.user.idAkun,
                style: poppinsMediumBlack,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xFF2A2A72).withOpacity(0.1),
                ),
                child: const Icon(
                  Icons.person,
                  color: Color(0xFF2A2A72),
                ),
              ),
              title: Text("Nama Lengkap",
                  style: poppinsMediumBlack.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 15)),
              subtitle: Text(
                _currentUser.user.namaLengkap,
                style: poppinsMediumBlack,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xFF2A2A72).withOpacity(0.1),
                ),
                child: const Icon(
                  Icons.call,
                  color: Color(0xFF2A2A72),
                ),
              ),
              title: Text("Nomer Telepon",
                  style: poppinsMediumBlack.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 15)),
              subtitle: Text(
                _currentUser.user.noHp,
                style: poppinsMediumBlack,
              ),
            ),
          ),
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
