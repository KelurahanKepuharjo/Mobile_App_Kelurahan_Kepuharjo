import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Comm/getTextForm.dart';
import 'package:kepuharjo_app/Comm/getTextFormDateTime.dart';
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
final id_akun = TextEditingController();

class _AktaState extends State<Akta> {
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

  void verifyDomisili() {
    if (nama_anak.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nama Anak harus diisi");
    } else if (tempat_lahir.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tempat Lahir harus diisi");
    } else if (tanggal_lahir.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tanggal Lahir harus diisi");
    } else if (jenis_kelamin.text.isEmpty) {
      Fluttertoast.showToast(msg: "Jenis Kelamin harus diisi");
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
    } else {
      addData();
    }
  }

  void addData() async {
    // var usr = await RememberUser().getUser();
    // User user = User.fromJson(json.decode(usr));
    await http.post(Uri.parse(ApiConnect.akta), body: {
      "id_surat": id_surat.text,
      "nomor_surat": nomor_surat.text,
      "nama_anak": nama_anak.text,
      "tempat_lahir": tempat_lahir.text,
      "tanggal_lahir": tanggal_lahir.text,
      "jenis_kelamin": jenis_kelamin.text,
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
    });
    // var res = await json.decode(response.body);
    // if (res == "Success") {
    //   showSuccessDialog();
    // } else {
    //   Fluttertoast.showToast(msg: "gagal");
    // }
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
                controller: nama_anak,
                hintName: "Nama Anak",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: tempat_lahir,
                hintName: "Tempat Lahir",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
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
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: agama,
                hintName: "Agama",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: status,
                hintName: "Status",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: pekerjaan,
                hintName: "Pekerjaan",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: nik,
                hintName: "Nik",
                keyboardType: TextInputType.number,
                inputFormatters: FilteringTextInputFormatter.digitsOnly,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: alamat,
                hintName: "Alamat",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: nama_ayah,
                hintName: "Nama Ayah",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: umur_ayah,
                hintName: "Umur Ayah",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: kebangsaan_ayah,
                hintName: "Kebangsaan Ayah",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
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
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: pekerjaan_ayah,
                hintName: "Pekerjaan Ayah",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: alamat_ayah,
                hintName: "Alamat Ayah",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: nama_ibu,
                hintName: "Nama Ibu",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: umur_ibu,
                hintName: "Umur Ibu",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: kebangsaan_ibu,
                hintName: "Kebangsaan Ibu",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
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
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: pekerjaan_ibu,
                hintName: "Pekerjaan Ibu",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: alamat_ibu,
                hintName: "Alamat Ibu",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
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
                          verifyDomisili();
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
          nama_anak.clear();
          tempat_lahir.clear();
          tanggal_lahir.clear();
          jenis_kelamin.clear();
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
        });
        snackBarSucces();
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
