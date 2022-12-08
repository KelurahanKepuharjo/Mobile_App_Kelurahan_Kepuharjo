import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Comm/getTextForm.dart';
import 'package:kepuharjo_app/Comm/getTextForm.dart';
import 'package:kepuharjo_app/Comm/getTextFormDateTime.dart';
import 'package:kepuharjo_app/Controller/Current_UserLogin.dart';
import 'package:kepuharjo_app/Model/RememberUser.dart';
import 'package:kepuharjo_app/Model/User_Model.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/Domisili.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class Kematian extends StatefulWidget {
  const Kematian({Key key}) : super(key: key);

  @override
  State<Kematian> createState() => _KematianState();
}

final id_surat = TextEditingController();
final no_surat = TextEditingController();
final nama_almarhum = TextEditingController();
final saksi_kematian = TextEditingController();
final hubungan = TextEditingController();
final hari = TextEditingController();
final tanggal = TextEditingController();
final bulan= TextEditingController();
final tahun= TextEditingController();
final alamat = TextEditingController();
final nik_almarhum = TextEditingController();
final penyebab_kematian = TextEditingController();
final surat_digunakan = TextEditingController();
final tanggal_dibuat = TextEditingController();
final id_akun = TextEditingController();

class _KematianState extends State<Kematian> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   verifySKTM();
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   nama.dispose();
  //   tempatlahir.dispose();
  //   tgllhir.dispose();
  //   jk.dispose();
  //   kebangsaan.dispose();
  //   agama.dispose();
  //   status.dispose();
  //   pekerjaan.dispose();
  //   nik.dispose();
  //   alamat.dispose();
  //   keperluan.dispose();
  // }

  void verifyKematian() {
    if (nama_almarhum.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nama Almarhum harus diisi");
    } else if (saksi_kematian.text.isEmpty) {
      Fluttertoast.showToast(msg: "Saksi Kematian harus diisi");
    } else if (hubungan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Hubungan harus diisi");
    } else if (hari.text.isEmpty) {
      Fluttertoast.showToast(msg: "Hari harus diisi");
    } else if (tanggal.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tanggal harus diisi");
     } else if (bulan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Bulan harus diisi");
    } else if (tahun.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tahun harus diisi");
    } else if (alamat.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alamat harus diisi");
    } else if (nik_almarhum.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nik Almarhum harus diisi");
    } else if (penyebab_kematian.text.isEmpty) {
      Fluttertoast.showToast(msg: "Penyebab Kematian harus diisi");
    } else if (surat_digunakan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Surat Digunakan harus diisi");
      addData();
    }
  }
  
final CurrentUser _currentUser = Get.put(CurrentUser());
  void addData() async {
    await http.post(Uri.parse(ApiConnect.kematian), body: {
      "id_akun": _currentUser.user.idAkun,
      "nama_almarhum": nama_almarhum.text,
      "saksi_kematian": saksi_kematian.text,
      "hubungan": hubungan.text,
      "hari": hari.text,
      "tanggal": tanggal.text,
      "bulan": bulan.text,
      "tahun": tahun.text,
      "alamat": alamat.text,
      "nik_almarhum": nik_almarhum.text,
      "penyebab_kematian": penyebab_kematian.text,
      "surat_digunakan_untuk": surat_digunakan_untuk.text,
    });
    showSuccessDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.keyboard_arrow_left),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'Detail Surat',
          style: GoogleFonts.poppins(
              color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                color: Color(0xFF2A2A72),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ))),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: getTextForm(
                  isReadOnly: true,
                  controller: id_akun,
                  hintName: "Nik anda",
                  keyboardType: TextInputType.number,
                  inputFormatters: FilteringTextInputFormatter.digitsOnly,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Lengkapi data berikut :",
                    style: poppinsMediumBlack,
                  )
                ],
              ),
              const Divider(
                height: 20,
                color: Colors.black,
              ),
              // getTextForm(
              //   isReadOnly: true,
              //   controller: id_akun,
              //   hintName: "Nik anda",
              //   keyboardType: TextInputType.number,
              //   inputFormatters: FilteringTextInputFormatter.digitsOnly,
              // ),
              const SizedBox(height: 5),
              getTextForm(
                controller: nama_almarhum,
                hintName: "Nama Almarhum",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                    length: 50,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: saksi_kematian,
                hintName: "Saksi Kematian",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                    length: 50,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: hubungan,
                hintName: "Hubungan",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                    length: 20,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: hari,
                hintName: "Hari Kematian",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                    length: 7,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: tanggal,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: alamat,
                hintName: "Alamat",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                    length: 30,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: nik_almarhum,
                hintName: "NIK Almarhum",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                    length :16
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: penyebab_kematian,
                hintName: "Penyebab Kematian",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                    length: 50,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: surat_digunakan_untuk,
                hintName: "Surat Digunakan untuk",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                    length: 50,

              ),
              const SizedBox(height: 5),
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
                        onPressed: () {
                          verifyKematian();
                        },
                        child: Text(
                          'Kirim',
                          style:
                              poppinsSmallBlack.copyWith(color: Colors.white),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  showSuccessDialog() {
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.WARNING,
      title: 'Warning!',
      titleTextStyle: poppinsLargeBlack.copyWith(
          fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF2A2A72)),
      desc: 'Apakah anda yakin, Jika data yang anda masukan telah benar',
      descTextStyle: nunitoMediumBlack.copyWith(color: Colors.grey),
      btnOkOnPress: () {
        setState(() {
          id_akun.clear();
          nama_almarhum.clear();
          saksi_kematian.clear();
          hubungan.clear();
          tanggal.clear();
          hari.clear();
          alamat.clear();
          nik_almarhum.clear();
          penyebab_kematian.clear();
          surat_digunakan_untuk.clear();
        });
        snackBarSucces();
        Navigator.pop(context);
      },
      btnCancelOnPress: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Kematian()));
      },
      btnCancelIcon: Icons.close,
      btnOkIcon: Icons.done,
    ).show();
  }

  snackBarSucces() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        content: AwesomeSnackbarContent(
            title: "Berhasil",
            message: "Surat berhasil diajukan",
            contentType: ContentType.success)));
  }
}
