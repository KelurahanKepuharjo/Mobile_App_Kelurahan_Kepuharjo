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

class Pindah extends StatefulWidget {
  const Pindah({Key key}) : super(key: key);

  @override
  State<Pindah> createState() => _PindahState();
}

final rt = TextEditingController();
final rw = TextEditingController();
final nama = TextEditingController();
final tempatLahir = TextEditingController();
final tglLahir = TextEditingController();
final agama = TextEditingController();
final alamatAsal = TextEditingController();
final alamatTujuan = TextEditingController();
final kelurahan = TextEditingController();
final kecamatan = TextEditingController();
final kabupaten = TextEditingController();
final provinsi = TextEditingController();
final alasan = TextEditingController();
final pengikut = TextEditingController();

class _PindahState extends State<Pindah> {
  void verifyPindah(BuildContext context) {
    if (nama.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nama harus diisi");
    } else if (tempatLahir.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tempat Lahir harus diisi");
    } else if (val_status == null) {
      Fluttertoast.showToast(msg: "Status harus diisi");
    } else if (tglLahir.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tanggal Lahir harus diisi");
    } else if (val_jenis_kelamin == null) {
      Fluttertoast.showToast(msg: "Jenis Kelamin harus diisi");
    } else if (agama.text.isEmpty) {
      Fluttertoast.showToast(msg: "Agama harus diisi");
    } else if (alamatAsal.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alamat Asal harus diisi");
    } else if (alamatTujuan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alamat Tujuan harus diisi");
    } else if (kelurahan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Kelurahan harus diisi");
    } else if (kecamatan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Kecamatan harus diisi");
    } else if (kabupaten.text.isEmpty) {
      Fluttertoast.showToast(msg: "Kabupaten harus diisi");
    } else if (provinsi.text.isEmpty) {
      Fluttertoast.showToast(msg: "Profinsi harus diisi");
    } else if (alasan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alasan Pindah harus diisi");
    } else if (pengikut.text.isEmpty) {
      Fluttertoast.showToast(msg: "Pengikut harus diisi");
    } else if (rt.text.isEmpty) {
      Fluttertoast.showToast(msg: "RT harus diisi");
    } else if (rw.text.isEmpty) {
      Fluttertoast.showToast(msg: "RW harus diisi");
    } else if (image == null) {
      Fluttertoast.showToast(msg: "Silahkan upload foto kk anda");
    } else {
      addDataSurat(context, image);
    }
  }

  final CurrentUser _currentUser = Get.put(CurrentUser());

  Future addDataSurat(BuildContext context, File imageFile) async {
    var uri = Uri.parse(ApiConnect.pindah);
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var req = http.MultipartRequest('POST', uri);
    req.fields['id_akun'] = _currentUser.user.idAkun;
    req.fields['nama'] = nama.text;
    req.fields['tempat_lahir'] = tempatLahir.text;
    req.fields['tanggal_lahir'] = tglLahir.text;
    req.fields['jenis_kelamin'] = val_jenis_kelamin;
    req.fields['status'] = val_status;
    req.fields['agama'] = agama.text;
    req.fields['alamat_asal'] = alamatAsal.text;
    req.fields['alamat_tujuan'] = alamatTujuan.text;
    req.fields['kelurahan'] = kelurahan.text;
    req.fields['kecamatan'] = kecamatan.text;
    req.fields['kabupaten'] = kabupaten.text;
    req.fields['provinsi'] = provinsi.text;
    req.fields['alasan_pindah'] = alasan.text;
    req.fields['pengikut'] = pengikut.text;
    req.fields['tgl_pengajuan'] = DateTime.now().toString();
    req.fields['status_surat'] = statusSurat;
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
  String val_jenis_kelamin;
  String val_status;
  List st = ["Kawin", "Belum Kawin"];
  List jkl = ["Laki Laki", "Perempuan"];

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
                hintName: "Nama",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 60,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: tempatLahir,
                hintName: "Tempat Lahir",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 30,
              ),
              const SizedBox(height: 5),
              getDateTime(
                controller: tglLahir,
              ),
              const SizedBox(height: 5),
              Container(
                height: 58,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: appColor)),
                child: DropdownButton(
                  onChanged: (value) {
                    setState(() {
                      val_jenis_kelamin = value;
                    });
                  },
                  underline: SizedBox(),
                  value: val_jenis_kelamin,
                  style: poppinsSmallBlack,
                  iconSize: 25,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(15),
                  elevation: 0,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: Text("Pilih Jenis Kelamin",
                      style: GoogleFonts.poppins(fontSize: 12)),
                  dropdownColor: Colors.white,
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
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: appColor)),
                child: DropdownButton(
                  onChanged: (value) {
                    setState(() {
                      val_status = value;
                    });
                  },
                  underline: SizedBox(),
                  value: val_status,
                  style: poppinsSmallBlack,
                  iconSize: 25,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(15),
                  elevation: 0,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: Text("Pilih Status",
                      style: GoogleFonts.poppins(fontSize: 12)),
                  dropdownColor: Colors.white,
                  items: st.map((e) {
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
                controller: alamatAsal,
                hintName: "Alamat Asal",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 60,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: alamatTujuan,
                hintName: "Alamat Tujuan",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 60,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: kelurahan,
                hintName: "Kelurahan",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 10,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: kecamatan,
                hintName: "Kecamatan",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 10,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: kabupaten,
                hintName: "Kabupaten",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 30,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: provinsi,
                hintName: "Provinsi",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 30,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: alasan,
                hintName: "Alasan Pindah",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 60,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: pengikut,
                hintName: "Pengikut",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 15,
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
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: appColor),
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
                          verifyPindah(context);
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
          tempatLahir.clear();
          tglLahir.clear();
          agama.clear();
          alamatAsal.clear();
          alamatTujuan.clear();
          kelurahan.clear();
          kecamatan.clear();
          kabupaten.clear();
          provinsi.clear();
          alasan.clear();
          pengikut.clear();
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
