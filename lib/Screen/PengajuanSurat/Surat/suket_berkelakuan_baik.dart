import 'dart:async';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kepuharjo_app/Comm/getTextFormDateTime.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Comm/getTextForm.dart';
import 'package:kepuharjo_app/Controller/Current_UserLogin.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class BerkelakuanBaik extends StatefulWidget {
  const BerkelakuanBaik({Key key}) : super(key: key);

  @override
  State<BerkelakuanBaik> createState() => _BerkelakuanBaikState();
}

final nama = TextEditingController();
final tempat_lahir = TextEditingController();
final tanggal_lahir = TextEditingController();
final jenis_kelamin = TextEditingController();
final kebangsaan= TextEditingController();
final Agama = TextEditingController();
final status = TextEditingController();
final pekerjaan = TextEditingController();
final nik = TextEditingController();
final alamat= TextEditingController();
final status_surat= TextEditingController();
final tgl_dibuat = TextEditingController();
final tgl_pengajuan = TextEditingController();
final RT = TextEditingController();
final RW = TextEditingController();
final surat_digunakan_untuk = TextEditingController();

class _BerkelakuanBaikState extends State<BerkelakuanBaik> {
  void verifyBerkelakuanBaik(BuildContext context) {
    if (nama.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nama harus diisi");
    } else if (tempat_lahir.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tempat Lahir harus diisi");
    } else if (tanggal_lahir.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tanggal Lahir harus diisi");
    } else if (jenis_kelamin.text.isEmpty) {
      Fluttertoast.showToast(msg: "Jenis Kelamin harus diisi");
    } else if (kebangsaan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Kebangsaan harus diisi");
    } else if (Agama.text.isEmpty) {
      Fluttertoast.showToast(msg: "Agama harus diisi");
    } else if (status.text.isEmpty) {
      Fluttertoast.showToast(msg: "Status harus diisi");
    } else if (pekerjaan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Pekerjaan harus diisi");
    } else if (nik.text.isEmpty) {
      Fluttertoast.showToast(msg: "NIK harus diisi");
    } else if (alamat.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alamat harus diisi");
    } else if (RT.text.isEmpty) {
      Fluttertoast.showToast(msg: "RT harus diisi");
    } else if (RW.text.isEmpty) {
      Fluttertoast.showToast(msg: "RW harus diisi");
    } else if (surat_digunakan_untuk.text.isEmpty) {
      Fluttertoast.showToast(msg: "Surat Digunakan Untuk harus diisi");
    } else if (image == null) {
      Fluttertoast.showToast(msg: "Silahkan upload foto kk anda");
    } else {
      addDataSurat(context, image);
    }
  }

  final CurrentUser _currentUser = Get.put(CurrentUser());

  Future addDataSurat(BuildContext context, File imageFile) async {
    var uri = Uri.parse(ApiConnect.berkelakuanBaik);
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var req = http.MultipartRequest('POST', uri);
    req.fields['id_akun'] = _currentUser.user.idAkun;
    req.fields['nama'] = nama.text;
    req.fields['tempat_lahir'] = tempat_lahir.text;
    req.fields['tanggal_lahir'] = tanggal_lahir.text;
    req.fields['jenis_kelamin'] = jenis_kelamin.text;
    req.fields['kebangsaan'] = kebangsaan.text;
    req.fields['agama'] = Agama.text;
    req.fields['status'] = status.text;
    req.fields['pekerjaan'] = pekerjaan.text;
    req.fields['nik'] = nik.text;
    req.fields['alamat'] = alamat.text;
    req.fields['status_surat'] = statusSurat;
    req.fields['tgl_pengajuan'] = DateTime.now().toString();
    req.fields['RT'] = RT.text;
    req.fields['RW'] = RW.text;
    req.fields['surat_digunakan_untuk'] = surat_digunakan_untuk.text;
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
          'Surat Keterangan Berkelakuan Baik',
          style: GoogleFonts.poppins(
              color: whiteColor, fontSize: 14, fontWeight: FontWeight.bold),
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
                controller: nama,
                hintName: "Nama",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 50,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: tempat_lahir,
                hintName: "Tempat Lahir",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 50,
              ),
              const SizedBox(height: 5),
              getDateTime(
                controller: tanggal_lahir,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: jenis_kelamin,
                hintName: "Jenis Kelamin",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 20,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: kebangsaan,
                hintName: "Kebangsaan",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 7,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: Agama,
                hintName: "Agama",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 30,
              ),
              const SizedBox(height: 5),
              getTextForm(
                  controller: status,
                  hintName: "Status",
                  keyboardType: TextInputType.number,
                  inputFormatters: FilteringTextInputFormatter.digitsOnly,
                  length: 16),
              const SizedBox(height: 5),
              getTextForm(
                controller: pekerjaan,
                hintName: "Pekerjaan",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 50,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: nik,
                hintName: "NIK",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 50,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: alamat,
                hintName: "Alamat Sesuai KTP",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 50,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: RT,
                hintName: "RT",
                keyboardType: TextInputType.number,
                inputFormatters: FilteringTextInputFormatter.digitsOnly,
                length: 5,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: RW,
                hintName: "RW",
                keyboardType: TextInputType.number,
                inputFormatters: FilteringTextInputFormatter.digitsOnly,
                length: 5,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: surat_digunakan_untuk,
                hintName: "Surat Digunakan Untuk",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 50,
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
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: appColor)),
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
                          verifyBerkelakuanBaik(context);
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
          nama.clear();
          tempat_lahir.clear();
          tanggal_lahir.clear();
          jenis_kelamin.clear();
          kebangsaan.clear();
          Agama.clear();
          status.clear();
          pekerjaan.clear();
          nik.clear();
          alamat.clear();
          RT.clear();
          RW.clear();
          surat_digunakan_untuk.clear();
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
