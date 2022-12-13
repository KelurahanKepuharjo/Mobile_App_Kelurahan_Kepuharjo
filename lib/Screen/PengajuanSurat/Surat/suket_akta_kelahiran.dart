import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/Domisili.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_pindah.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_tidak_mampu.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Comm/getTextForm.dart';
import 'package:kepuharjo_app/Comm/getTextFormDateTime.dart';
import 'package:kepuharjo_app/Controller/Current_UserLogin.dart';
import 'package:kepuharjo_app/Model/RememberUser.dart';
import 'package:kepuharjo_app/Model/User_Model.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class Akta extends StatefulWidget {
  const Akta({Key key}) : super(key: key);

  @override
  State<Akta> createState() => _AktaState();
}

final id_surat = TextEditingController();
final nomor_surat = TextEditingController();
final nama_anak = TextEditingController();
final tempat_lahir = TextEditingController();
final tanggal_lahir = TextEditingController();
final jenis_kelamin = TextEditingController();
final kebangsaan = TextEditingController();
final agama = TextEditingController();
final status = TextEditingController();
final pekerjaan = TextEditingController();
final nik = TextEditingController();
final alamat = TextEditingController();
final nama_ayah = TextEditingController();
final umur_ayah = TextEditingController();
final kebangsaan_ayah = TextEditingController();
final agama_ayah = TextEditingController();
final pekerjaan_ayah = TextEditingController();
final alamat_ayah = TextEditingController();
final nama_ibu = TextEditingController();
final umur_ibu = TextEditingController();
final kebangsaan_ibu = TextEditingController();
final agama_ibu = TextEditingController();
final pekerjaan_ibu = TextEditingController();
final alamat_ibu = TextEditingController();
final tgl_pengajuan = TextEditingController();
final surat_digunakan_untuk = TextEditingController();
final id_akun = TextEditingController();

class _AktaState extends State<Akta> {
  void verifyAkta(BuildContext context) {
    if (nama_anak.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nama Anak harus diisi");
    } else if (tempat_lahir.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tempat Lahir harus diisi");
    } else if (tanggal_lahir.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tanggal Lahir harus diisi");
    } else if (jenis_kelamin.text.isEmpty) {
      Fluttertoast.showToast(msg: "Jenis Kelamin harus diisi");
    } else if (kebangsaan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Kebangsaan harus diisi");
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
    } else if (nama_ayah.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nama Ayah harus diisi");
    } else if (umur_ayah.text.isEmpty) {
      Fluttertoast.showToast(msg: "Umur Ayah harus diisi");
    } else if (kebangsaan_ayah.text.isEmpty) {
      Fluttertoast.showToast(msg: "Kebangsaan Ayah harus diisi");
    } else if (agama_ayah.text.isEmpty) {
      Fluttertoast.showToast(msg: "Agama Ayah harus diisi");
    } else if (pekerjaan_ayah.text.isEmpty) {
      Fluttertoast.showToast(msg: "Pekerjaan Ayah harus diisi");
    } else if (alamat_ayah.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alamat Ayah harus diisi");
    } else if (nama_ibu.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nama Ibu harus diisi");
    } else if (umur_ibu.text.isEmpty) {
      Fluttertoast.showToast(msg: "Umur Ibu harus diisi");
    } else if (kebangsaan_ibu.text.isEmpty) {
      Fluttertoast.showToast(msg: "Kebangsaan Ibu harus diisi");
    } else if (agama_ibu.text.isEmpty) {
      Fluttertoast.showToast(msg: "Agama Ibu harus diisi");
    } else if (pekerjaan_ibu.text.isEmpty) {
      Fluttertoast.showToast(msg: "Pekerjaan Ibu harus diisi");
    } else if (alamat_ibu.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alamat Ibu harus diisi");
    } else if (surat_digunakan_untuk.text.isEmpty) {
      Fluttertoast.showToast(msg: "Surat digunakan untuk harus diisi");
    } else {
      addDataSurat(context, image);
    }
  }

  final CurrentUser _currentUser = Get.put(CurrentUser());
  void addData(BuildContext context) async {
    await http.post(Uri.parse(ApiConnect.akta), body: {
      "id_akun": _currentUser.user.idAkun,
      "nama_anak": nama_anak.text,
      "tempat_lahir": tempat_lahir.text,
      "tanggal_lahir": tanggal_lahir.text,
      "jenis_kelamin": val_jenis_kelamin,
      "kebangsaan": val_kebangsaan,
      "agama": agama.text,
      "status": status.text,
      "pekerjaan": pekerjaan.text,
      "nik": nik.text,
      "alamat": alamat.text,
      "nama_ayah": nama_ayah.text,
      "umur_ayah": umur_ayah.text,
      "kebangsaan_ayah": kebangsaan_ayah.text,
      "agama_ayah": agama_ayah.text,
      "pekerjaan_ayah": pekerjaan_ayah.text,
      "alamat_ayah": alamat_ayah.text,
      "nama_ibu": nama_ibu.text,
      "umur_ibu": umur_ibu.text,
      "kebangsaan_ibu": kebangsaan_ibu.text,
      "agama_ibu": agama_ibu.text,
      "pekerjaan_ibu": pekerjaan_ibu.text,
      "alamat_ibu": alamat_ibu.text,
      "tgl_pengajuan": tgl_pengajuan.text,
      "surat_digunakan_untuk": surat_digunakan_untuk.text,
    });
    showSuccessDialog(context);
  }

  Future addDataSurat(BuildContext context, File imageFile) async {
    var uri = Uri.parse(ApiConnect.akta);
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var req = http.MultipartRequest('POST', uri);
    req.fields['id_akun'] = _currentUser.user.idAkun;
    req.fields['nama_lengkap'] = nama_anak.text;
    req.fields['tempat_lahir'] = tempatlahir.text;
    req.fields['tanggal_lahir'] = tanggal_lahir.text;
    req.fields['jenis_kelamin'] = val_jenis_kelamin;
    req.fields['kebangsaan'] = val_kebangsaan;
    req.fields['agama'] = agama.text;
    req.fields['status'] = status.text;
    req.fields['pekerjaan'] = pekerjaan.text;
    req.fields['nik'] = nik.text;
    req.fields['alamat'] = alamat.text;
    req.fields['nama_ayah'] = nama_ayah.text;
    req.fields['umur_ayah'] = umur_ayah.text;
    req.fields['kebangsaan_ayah'] = kebangsaan_ayah.text;
    req.fields['agama_ayah'] = agama_ayah.text;
    req.fields['pekerjaan_ayah'] = pekerjaan_ayah.text;
    req.fields['alamat_ayah'] = alamat_ayah.text;
    req.fields['nama_ibu'] = nama_ibu.text;
    req.fields['umur_ibu'] = umur_ibu.text;
    req.fields['kebangsaan_ibu'] = kebangsaan_ibu.text;
    req.fields['agama_ibu'] = agama_ibu.text;
    req.fields['pekerjaan_ibu'] = pekerjaan_ibu.text;
    req.fields['alamat_ibu'] = alamat_ibu.text;
    req.fields['tgl_pengajuan'] = DateTime.now().toString();
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
  String val_jenis_kelamin;
  String val_kebangsaan;
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
              const SizedBox(height: 5),
              getTextForm(
                controller: nama_anak,
                hintName: "nama lengkap",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 60,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: tempat_lahir,
                hintName: "Tempat Lahir",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 40,
              ),
              const SizedBox(height: 5),
              getDateTime(
                controller: tanggal_lahir,
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
                      val_jenis_kelamin = value;
                    });
                  },
                  underline: SizedBox(),
                  value: val_jenis_kelamin,
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
                hintName: "agama",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 12,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: status,
                hintName: "status",
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
                controller: nama_ayah,
                hintName: "Nama Ayah",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 50,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: umur_ayah,
                hintName: "Umur Ayah",
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
                  hint: Text("Kebangsaan Ayah",
                      style: GoogleFonts.poppins(fontSize: 12)),
                  dropdownColor: Colors.grey.shade300,
                  items: kb.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              getTextForm(
                controller: agama_ayah,
                hintName: "Agama Ayah",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 12,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: pekerjaan_ayah,
                hintName: "Pekerjaan Ayah",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 30,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: alamat_ayah,
                hintName: "Alamat Ayah Sesuai Ktp",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 30,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: nama_ibu,
                hintName: "Nama Ibu",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 50,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: umur_ibu,
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
                  hint: Text("Kebangsaan Ibu",
                      style: GoogleFonts.poppins(fontSize: 12)),
                  dropdownColor: Colors.grey.shade300,
                  items: kb.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              getTextForm(
                controller: agama_ibu,
                hintName: "Agama ibu",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 12,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: pekerjaan_ibu,
                hintName: "Pekerjaan Ibu",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 30,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: alamat_ibu,
                hintName: "Alamat Ibu Sesuai Ktp",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 30,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: surat_digunakan_untuk,
                hintName: "surat digunakan untuk",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 225,
              ),
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
          fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF2A2A72)),
      desc: 'Apakah anda yakin, Jika data yang anda masukan telah benar',
      descTextStyle: nunitoMediumBlack.copyWith(color: Colors.grey),
      btnOkOnPress: () {
        setState(() {
          id_akun.clear();
          nama_anak.clear();
          tempat_lahir.clear();
          tanggal_lahir.clear();
          jenis_kelamin.clear();
          kebangsaan.clear();
          agama.clear();
          status.clear();
          pekerjaan.clear();
          nik.clear();
          alamat.clear();
          nama_ayah.clear();
          umur_ayah.clear();
          kebangsaan_ayah.clear();
          agama_ayah.clear();
          pekerjaan_ayah.clear();
          alamat_ayah.clear();
          nama_ibu.clear();
          umur_ibu.clear();
          kebangsaan_ibu.clear();
          agama_ibu.clear();
          pekerjaan_ibu.clear();
          alamat_ibu.clear();
          surat_digunakan_untuk.clear();
        });
        snackBarSucces(context);
        Navigator.pop(context);
      },
      btnCancelOnPress: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Akta()));
      },
      btnCancelIcon: Icons.close,
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
