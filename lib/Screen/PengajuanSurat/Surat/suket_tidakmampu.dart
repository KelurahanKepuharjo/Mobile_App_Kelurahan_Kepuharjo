import 'dart:async';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Comm/getTextForm.dart';
import 'package:kepuharjo_app/Comm/getTextFormDateTime.dart';
import 'package:kepuharjo_app/Controller/Current_UserLogin.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class SKTM extends StatefulWidget {
  const SKTM({Key key}) : super(key: key);

  @override
  State<SKTM> createState() => _SKTMState();
}

final nama = TextEditingController();
final tempatlahir = TextEditingController();
final tgllhir = TextEditingController();
final jk = TextEditingController();
final kebangsaan = TextEditingController();
final agama = TextEditingController();
final status = TextEditingController();
final pekerjaan = TextEditingController();
final nik = TextEditingController();
final alamat = TextEditingController();
final keperluan = TextEditingController();
final rT = TextEditingController();
final rW = TextEditingController();

class _SKTMState extends State<SKTM> {
  void verifySKTM(BuildContext context) {
    if (nama.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nama Lengkap harus diisi");
    } else if (tempatlahir.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tempat Lahir harus diisi");
    } else if (tgllhir.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tanggal Lahir harus diisi");
    } else if (agama.text.isEmpty) {
      Fluttertoast.showToast(msg: "Agama harus diisi");
    } else if (status.text.isEmpty) {
      Fluttertoast.showToast(msg: "Status harus diisi");
    } else if (pekerjaan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Pekerjaan harus diisi");
    } else if (nik.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nik harus diisi");
    } else if (alamat.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alamat harus diisi");
    } else if (keperluan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Keperluan harus diisi");
    } else if (rT.text.isEmpty) {
      Fluttertoast.showToast(msg: "RT harus diisi");
    } else if (rW.text.isEmpty) {
      Fluttertoast.showToast(msg: "RW harus diisi");
    } else {
      addDataSurat(context, image);
    }
  }

  final CurrentUser _currentUser = Get.put(CurrentUser());

  Future addDataSurat(BuildContext context, File imageFile) async {
    var uri = Uri.parse(ApiConnect.sktm);
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var req = http.MultipartRequest('POST', uri);
    req.fields['id_akun'] = _currentUser.user.idAkun;
    req.fields['nama'] = nama.text;
    req.fields['tempat_lahir'] = tempatlahir.text;
    req.fields['tanggal_lahir'] = tgllhir.text;
    req.fields['jenis_kelamin'] = val_jk;
    req.fields['kebangsaan'] = val_kebangsaan;
    req.fields['agama'] = agama.text;
    req.fields['status'] = status.text;
    req.fields['pekerjaan'] = pekerjaan.text;
    req.fields['nik'] = nik.text;
    req.fields['alamat'] = alamat.text;
    req.fields['status_surat'] = statusSurat;
    req.fields['tgl_pengajuan'] = DateTime.now().toString();
    req.fields['keperluan'] = keperluan.text;
    req.fields['RT'] = rT.text;
    req.fields['RW'] = rW.text;
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

  String statusSurat = "Diajukan";
  File image;
  String val_jk;
  String val_kebangsaan;
  List jkl = ["Laki Laki", "Perempuan"];
  List kb = ["WNI", "WNA"];
  // final picker = ImagePicker()
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
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                hintName: "Nama Lengkap",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 60,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: tempatlahir,
                hintName: "Tempat Lahir",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 30,
              ),
              const SizedBox(height: 5),
              getDateTime(
                controller: tgllhir,
              ),
              const SizedBox(height: 5),
              Container(
                height: 58,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(179, 234, 234, 234),
                ),
                child: DropdownButton(
                  onChanged: (value) {
                    setState(() {
                      val_jk = value;
                    });
                  },
                  underline: SizedBox(),
                  value: val_jk,
                  style: poppinsMediumBlack,
                  iconSize: 25,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(20),
                  elevation: 0,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: Text("Pilih Jenis Kelamin",
                      style: GoogleFonts.poppins(fontSize: 12)),
                  dropdownColor: Colors.grey.shade300,
                  items: jkl.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 58,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(179, 234, 234, 234),
                ),
                child: DropdownButton(
                  onChanged: (value) {
                    setState(() {
                      val_kebangsaan = value;
                    });
                  },
                  underline: SizedBox(),
                  value: val_kebangsaan,
                  style: poppinsMediumBlack,
                  iconSize: 25,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(20),
                  elevation: 0,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: Text("Pilih Kebangsaan",
                      style: GoogleFonts.poppins(fontSize: 12)),
                  dropdownColor: Colors.grey.shade300,
                  items: kb.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                ),
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: agama,
                hintName: "Agama",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 10,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: status,
                hintName: "Status Perkawinan",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 12,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: pekerjaan,
                hintName: "Pekerjaan",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 20,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: nik,
                hintName: "Nik",
                keyboardType: TextInputType.number,
                inputFormatters: FilteringTextInputFormatter.digitsOnly,
                length: 16,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: alamat,
                hintName: "Alamat Sesuai Ktp",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 50,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: keperluan,
                hintName: "Keperluan",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 150,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: rT,
                hintName: "RT",
                keyboardType: TextInputType.number,
                inputFormatters: FilteringTextInputFormatter.digitsOnly,
                length: 5,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: rW,
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
                          verifySKTM(context);
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
          fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF2A2A72)),
      desc: 'Apakah anda yakin, Jika data yang anda masukan telah benar',
      descTextStyle: nunitoMediumBlack.copyWith(color: Colors.grey),
      btnOkOnPress: () {
        setState(() {
          nama.clear();
          tempatlahir.clear();
          tgllhir.clear();
          kebangsaan.clear();
          agama.clear();
          status.clear();
          pekerjaan.clear();
          nik.clear();
          alamat.clear();
          keperluan.clear();
          jk.clear();
          rT.clear();
          rW.clear();
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
