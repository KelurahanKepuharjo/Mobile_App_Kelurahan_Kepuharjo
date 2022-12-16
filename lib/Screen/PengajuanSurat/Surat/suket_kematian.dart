import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kepuharjo_app/Comm/getTextFormDate.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Comm/getTextForm.dart';
import 'package:kepuharjo_app/Comm/getTextForm.dart';
import 'package:kepuharjo_app/Comm/getTextFormDateTime.dart';
import 'package:kepuharjo_app/Controller/Current_UserLogin.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class Kematian extends StatefulWidget {
  const Kematian({Key key}) : super(key: key);

  @override
  State<Kematian> createState() => _KematianState();
}

final rt = TextEditingController();
final rw = TextEditingController();
final nama_almarhum = TextEditingController();
final saksi_kematian = TextEditingController();
final hubungan = TextEditingController();
final hari = TextEditingController();
final tanggal = TextEditingController();
final alamat = TextEditingController();
final nik_almarhum = TextEditingController();
final penyebab_kematian = TextEditingController();
final surat_digunakan_untuk = TextEditingController();
final tgl_dibuat = TextEditingController();

class _KematianState extends State<Kematian> {
  void verifyKematian(BuildContext context) {
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
    } else if (alamat.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alamat harus diisi");
    } else if (nik_almarhum.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nik Almarhum harus diisi");
    } else if (penyebab_kematian.text.isEmpty) {
      Fluttertoast.showToast(msg: "Penyebab Kematian harus diisi");
    } else if (surat_digunakan_untuk.text.isEmpty) {
      Fluttertoast.showToast(msg: "Surat Digunakan harus diisi");
    } else if (rt.text.isEmpty) {
      Fluttertoast.showToast(msg: "RT harus diisi");
    } else if (rw.text.isEmpty) {
      Fluttertoast.showToast(msg: "RW harus diisi");
    } else {
      addDataSurat(context, image);
    }
  }

  final CurrentUser _currentUser = Get.put(CurrentUser());

  Future addDataSurat(BuildContext context, File imageFile) async {
    var uri = Uri.parse(ApiConnect.kematian);
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var req = http.MultipartRequest('POST', uri);
    req.fields['id_akun'] = _currentUser.user.idAkun;
    req.fields['nama_almarhum'] = nama_almarhum.text;
    req.fields['saksi_kematian'] = saksi_kematian.text;
    req.fields['hubungan'] = hubungan.text;
    req.fields['hari'] = hari.text;
    req.fields['tanggal'] = tanggal.text;
    req.fields['alamat'] = alamat.text;
    req.fields['nik_almarhum'] = nik_almarhum.text;
    req.fields['penyebab_kematian'] = penyebab_kematian.text;
    req.fields['surat_digunakan'] = surat_digunakan_untuk.text;
    req.fields['status_surat'] = statusSurat;
    req.fields['tgl_pengajuan'] = DateTime.now().toString();
    req.fields['RT'] = rt.text;
    req.fields['RW'] = rw.text;
    var pic = http.MultipartFile("image", stream, length,
        filename: basename(imageFile.path));
    req.files.add(pic);
    var response = await req.send();
    if (response.statusCode == 200) {
      print("ok");
      showSuccessDialog(context);
    } else {
      print("Ga");
    }
  }

  Future getImageGalerry() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(imageFile.path);
    });
  }

  File image;
  String statusSurat = "Diajukan";
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
            decoration: BoxDecoration(
                color: appColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ))),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
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
              getDateForm(
                controller: tanggal,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: alamat,
                hintName: "Alamat Sesuai Ktp",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 30,
              ),
              const SizedBox(height: 5),
              getTextForm(
                  controller: nik_almarhum,
                  hintName: "NIK Almarhum",
                  keyboardType: TextInputType.number,
                  inputFormatters: FilteringTextInputFormatter.digitsOnly,
                  length: 16),
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
              getTextForm(
                controller: rt,
                hintName: "RT",
                keyboardType: TextInputType.number,
                inputFormatters: FilteringTextInputFormatter.digitsOnly,
                length: 5,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: rw,
                hintName: "RW",
                keyboardType: TextInputType.number,
                inputFormatters: FilteringTextInputFormatter.digitsOnly,
                length: 5,
              ),
              const SizedBox(height: 5),
              InkWell(
                onTap: () {
                  getImageGalerry();
                },
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(179, 234, 234, 234),
                  ),
                  child: image == null
                      ? Center(
                          child: Text(
                          'Upload Foto KK',
                          style: GoogleFonts.poppins(fontSize: 12),
                        ))
                      : Image.file(
                          image,
                          fit: BoxFit.contain,
                        ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    width: 250,
                    decoration: BoxDecoration(
                      color: appColor,
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
                          verifyKematian(context);
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

  showSuccessDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.WARNING,
      title: 'Warning!',
      titleTextStyle: poppinsLargeBlack.copyWith(
          fontSize: 25, fontWeight: FontWeight.bold, color: appColor),
      desc: 'Apakah anda yakin, Jika data yang anda masukan telah benar',
      descTextStyle: nunitoMediumBlack.copyWith(color: Colors.grey),
      btnOkOnPress: () {
        setState(() {
          nama_almarhum.clear();
          saksi_kematian.clear();
          hubungan.clear();
          tanggal.clear();
          hari.clear();
          alamat.clear();
          nik_almarhum.clear();
          penyebab_kematian.clear();
          surat_digunakan_untuk.clear();
          rt.clear();
          rw.clear();
        });
        snackBarSucces(context);
        Navigator.pop(context);
      },
      btnOkIcon: Icons.done,
    ).show();
  }

  snackBarSucces(BuildContext context) {
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
