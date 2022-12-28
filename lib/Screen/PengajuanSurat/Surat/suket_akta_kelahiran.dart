import 'dart:io';
import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:kepuharjo_app/OrderStatus.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Comm/getTextForm.dart';
import 'package:kepuharjo_app/Comm/getTextFormDateTime.dart';
import 'package:kepuharjo_app/Controller/Current_UserLogin.dart';
import 'package:kepuharjo_app/Shared/shared.dart';
import 'package:provider/provider.dart';

class Akta extends StatefulWidget {
  const Akta({Key key}) : super(key: key);

  @override
  State<Akta> createState() => _AktaState();
}

final namaAnak = TextEditingController();
final tempatLahir = TextEditingController();
final tanggalLahir = TextEditingController();
final agama = TextEditingController();
final status = TextEditingController();
final pekerjaan = TextEditingController();
final nik = TextEditingController();
final alamat = TextEditingController();
final namaAyah = TextEditingController();
final umurAyah = TextEditingController();
final agamaAyah = TextEditingController();
final pekerjaanAyah = TextEditingController();
final alamatAyah = TextEditingController();
final namaIbu = TextEditingController();
final umurIbu = TextEditingController();
final agamaIbu = TextEditingController();
final pekerjaanIbu = TextEditingController();
final alamatIbu = TextEditingController();
final keperluan = TextEditingController();
final rt = TextEditingController();
final rw = TextEditingController();

class _AktaState extends State<Akta> {
  void verifyAkta(BuildContext context) {
    if (namaAnak.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nama Anak harus diisi");
    } else if (tempatLahir.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tempat Lahir harus diisi");
    } else if (tanggalLahir.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tanggal Lahir harus diisi");
    } else if (val_jenis_kelamin == null) {
      Fluttertoast.showToast(msg: "Jenis Kelamin harus diisi");
    } else if (val_kebangsaan == null) {
      Fluttertoast.showToast(msg: "Kebangsaan harus diisi");
    } else if (agama.text.isEmpty) {
      Fluttertoast.showToast(msg: "Agama harus diisi");
    } else if (val_status == null) {
      Fluttertoast.showToast(msg: "Status harus diisi");
    } else if (pekerjaan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Pekerjaan harus diisi");
    } else if (nik.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nik harus diisi");
    } else if (alamat.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alamat harus diisi");
    } else if (namaAyah.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nama Ayah harus diisi");
    } else if (umurAyah.text.isEmpty) {
      Fluttertoast.showToast(msg: "Umur Ayah harus diisi");
    } else if (valKebangsaanAyah == null) {
      Fluttertoast.showToast(msg: "Kebangsaan Ayah harus diisi");
    } else if (agamaAyah.text.isEmpty) {
      Fluttertoast.showToast(msg: "Agama Ayah harus diisi");
    } else if (pekerjaanAyah.text.isEmpty) {
      Fluttertoast.showToast(msg: "Pekerjaan Ayah harus diisi");
    } else if (alamatAyah.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alamat Ayah harus diisi");
    } else if (namaIbu.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nama Ibu harus diisi");
    } else if (umurIbu.text.isEmpty) {
      Fluttertoast.showToast(msg: "Umur Ibu harus diisi");
    } else if (valKebangsaanIbu == null) {
      Fluttertoast.showToast(msg: "Kebangsaan Ibu harus diisi");
    } else if (agamaIbu.text.isEmpty) {
      Fluttertoast.showToast(msg: "Agama Ibu harus diisi");
    } else if (pekerjaanIbu.text.isEmpty) {
      Fluttertoast.showToast(msg: "Pekerjaan Ibu harus diisi");
    } else if (alamatIbu.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alamat Ibu harus diisi");
    } else if (keperluan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Surat digunakan untuk harus diisi");
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

  final CurrentUser _currentUser = CurrentUser();

  Future addDataSurat(BuildContext context, File imageFile) async {
    var uri = Uri.parse(ApiConnect.akta);
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var req = http.MultipartRequest('POST', uri);
    req.fields['id_akun'] = _currentUser.user.idAkun;
    req.fields['nama_anak'] = namaAnak.text;
    req.fields['tempat_lahir'] = tempatLahir.text;
    req.fields['tanggal_lahir'] = tanggalLahir.text;
    req.fields['jenis_kelamin'] = val_jenis_kelamin;
    req.fields['kebangsaan'] = val_kebangsaan;
    req.fields['agama'] = agama.text;
    req.fields['status'] = val_status;
    req.fields['pekerjaan'] = pekerjaan.text;
    req.fields['nik'] = nik.text;
    req.fields['alamat'] = alamat.text;
    req.fields['nama_ayah'] = namaAyah.text;
    req.fields['umur_ayah'] = umurAyah.text;
    req.fields['kebangsaan_ayah'] = valKebangsaanAyah;
    req.fields['agama_ayah'] = agamaAyah.text;
    req.fields['pekerjaan_ayah'] = pekerjaanAyah.text;
    req.fields['alamat_ayah'] = alamatAyah.text;
    req.fields['nama_ibu'] = namaIbu.text;
    req.fields['umur_ibu'] = umurIbu.text;
    req.fields['kebangsaan_ibu'] = valKebangsaanIbu;
    req.fields['agama_ibu'] = agamaIbu.text;
    req.fields['pekerjaan_ibu'] = pekerjaanIbu.text;
    req.fields['alamat_ibu'] = alamatIbu.text;
    req.fields['tgl_pengajuan'] = DateTime.now().toString();
    req.fields['keperluan'] = keperluan.text;
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
      Provider.of<OrderStatus>(context, listen: false)
          .setInProgress(true, 'Akta');
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
  String val_kebangsaan;
  String valKebangsaanAyah;
  String valKebangsaanIbu;
  String val_status;
  List St = ["Kawin", "Belum Kawin"];
  List jkl = ["Laki Laki", "Perempuan"];
  List kb = ["WNI", "WNA"];

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
          'Surat Keterangan Kenal Lahir',
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
                controller: namaAnak,
                hintName: "Nama Anak",
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
                length: 40,
              ),
              const SizedBox(height: 5),
              getDateTime(
                controller: tanggalLahir,
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
                  underline: const SizedBox(),
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
                      val_kebangsaan = value;
                    });
                  },
                  underline: const SizedBox(),
                  value: val_kebangsaan,
                  style: poppinsSmallBlack,
                  iconSize: 25,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(15),
                  elevation: 0,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: Text("Pilih Kebangsaan",
                      style: GoogleFonts.poppins(fontSize: 12)),
                  dropdownColor: Colors.white,
                  items: kb.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                ),
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: agama,
                hintName: "agama",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 12,
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
                  items: St.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                ),
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: pekerjaan,
                hintName: "Pekerjaan",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 30,
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
                hintName: "Alamat",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 30,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: namaAyah,
                hintName: "Nama Ayah",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 50,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: umurAyah,
                hintName: "Umur Ayah",
                keyboardType: TextInputType.number,
                inputFormatters: FilteringTextInputFormatter.digitsOnly,
                length: 3,
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
                      valKebangsaanAyah = value;
                    });
                  },
                  underline: const SizedBox(),
                  value: valKebangsaanAyah,
                  style: poppinsSmallBlack,
                  iconSize: 25,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(15),
                  elevation: 0,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: Text("Kebangsaan Ayah",
                      style: GoogleFonts.poppins(fontSize: 12)),
                  dropdownColor: Colors.white,
                  items: kb.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              getTextForm(
                controller: agamaAyah,
                hintName: "Agama Ayah",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 12,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: pekerjaanAyah,
                hintName: "Pekerjaan Ayah",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 30,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: alamatAyah,
                hintName: "Alamat Ayah Sesuai Ktp",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 30,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: namaIbu,
                hintName: "Nama Ibu",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 50,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: umurIbu,
                hintName: "Umur Ibu",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 3,
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
                      valKebangsaanIbu = value;
                    });
                  },
                  underline: const SizedBox(),
                  value: valKebangsaanIbu,
                  style: poppinsSmallBlack,
                  iconSize: 25,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(15),
                  elevation: 0,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: Text("Kebangsaan Ibu",
                      style: GoogleFonts.poppins(fontSize: 12)),
                  dropdownColor: Colors.white,
                  items: kb.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              getTextForm(
                controller: agamaIbu,
                hintName: "Agama ibu",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 12,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: pekerjaanIbu,
                hintName: "Pekerjaan Ibu",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 30,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: alamatIbu,
                hintName: "Alamat Ibu Sesuai Ktp",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 30,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: keperluan,
                hintName: "keperluan",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 225,
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
                      color: Colors.white,
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
                          verifyAkta(context);
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
          namaAnak.clear();
          tempatLahir.clear();
          tanggalLahir.clear();
          agama.clear();
          status.clear();
          pekerjaan.clear();
          nik.clear();
          alamat.clear();
          namaAyah.clear();
          umurAyah.clear();
          agamaAyah.clear();
          pekerjaanAyah.clear();
          alamatAyah.clear();
          namaIbu.clear();
          umurIbu.clear();
          agamaIbu.clear();
          pekerjaanIbu.clear();
          alamatIbu.clear();
          keperluan.clear();
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
