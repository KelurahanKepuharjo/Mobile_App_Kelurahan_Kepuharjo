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
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_kematian.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class Domisili extends StatefulWidget {
  const Domisili({Key key}) : super(key: key);

  @override
  State<Domisili> createState() => _DomisiliState();
}

final id_surat = TextEditingController();
final no_surat = TextEditingController();
final nama = TextEditingController();
final tempat_lahir = TextEditingController();
final tanggal_lahir = TextEditingController();
final jenis_kelamin = TextEditingController();
final kebangsaan = TextEditingController();
final agama = TextEditingController();
final status_perkawinan = TextEditingController();
final pekerjaan = TextEditingController();
final nik = TextEditingController();
final alamat = TextEditingController();
final RT = TextEditingController();
final RW = TextEditingController();
final no_pengantar_surat = TextEditingController();
final tgl_surat_pengantar = TextEditingController();
final alamat_domisili_kel_kepu = TextEditingController();
final surat_digunakan_untuk = TextEditingController();
final tgl_surat_dibuat = TextEditingController();
final id_akun = TextEditingController();

class _DomisiliState extends State<Domisili> {
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
    if (nama.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nama Lengkap harus diisi");
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
    } else if (status_perkawinan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Status harus diisi");
    } else if (pekerjaan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Pekerjaan harus diisi");
    } else if (nik.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nik harus diisi");
    } else if (alamat.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alamat harus diisi");
    } else if (RT.text.isEmpty) {
      Fluttertoast.showToast(msg: "RT harus diisi");
    } else if (RW.text.isEmpty) {
      Fluttertoast.showToast(msg: "RW harus diisi");
    } else if (no_pengantar_surat.text.isEmpty) {
      Fluttertoast.showToast(msg: "No Pengantar Surat harus diisi");
    } else if (tgl_surat_pengantar.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tanggal Surat Pengantar harus diisi");
    } else if (alamat_domisili_kel_kepu.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alamat Domisili Kelurahan harus diisi");
    } else if (surat_digunakan_untuk.text.isEmpty) {
      Fluttertoast.showToast(msg: "Surat Digunakan Untuk harus diisi");
    } else if (tgl_surat_dibuat.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tanggal Surat Dibuat harus diisi");
    } else {
      addData();
    }
  }

  void addData() async {
    // var usr = await RememberUser().getUser();
    // User user = User.fromJson(json.decode(usr));
    await http.post(Uri.parse(ApiConnect.domisili), body: {
      "id_surat": id_surat.text,
      "no_surat": no_surat.text,
      "nama": nama.text,
      "tempat_lahir": tempat_lahir.text,
      "tanggal_lahir": tanggal_lahir.text,
      "jenis_kelamin": jenis_kelamin.text,
      "kebangsaan": kebangsaan.text,
      "agama": agama.text,
      "status perkawinan": status_perkawinan.text,
      "pekerjaan": pekerjaan.text,
      "nik": nik.text,
      "alamat": alamat.text,
      "RT": RT.text,
      "Rw": RW.text,
      "no_pengantar_surat": no_pengantar_surat.text,
      "tgl_surat_pengantar": tgl_surat_pengantar.text,
      "alamat_domisili_kel_kepu": alamat_domisili_kel_kepu.text,
      "Surat_digunakan_untuk": surat_digunakan_untuk.text,
      "tgl_surat_dibuat": tgl_surat_dibuat.text,
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
                controller: nama,
                hintName: "Nama Lengkap",
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
                controller: tanggal,
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
                controller: kebangsaan,
                hintName: "Kebangsaan",
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
                controller: status_perkawinan,
                hintName: "Status Perkawinan",
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
                controller: RT,
                hintName: "RT",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: RW,
                hintName: "RW",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: surat_digunakan_untuk,
                hintName: "Surat Digunakan Untuk",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
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
          nama.clear();
          tempat_lahir.clear();
          tanggal_lahir.clear();
          jenis_kelamin.clear();
          kebangsaan.clear();
          agama.clear();
          status_perkawinan.clear();
          pekerjaan.clear();
          nik.clear();
          alamat.clear();
          RT.clear();
          RW.clear();
          surat_digunakan_untuk.clear();
        });
        snackBarSucces();
        Navigator.pop(context);
      },
      btnCancelOnPress: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Domisili()));
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
