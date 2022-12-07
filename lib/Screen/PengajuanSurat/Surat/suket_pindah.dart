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
import 'package:kepuharjo_app/Comm/getTextForm.dart';
import 'package:kepuharjo_app/Comm/getTextFormDateTime.dart';
import 'package:kepuharjo_app/Model/RememberUser.dart';
import 'package:kepuharjo_app/Model/User_Model.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/Domisili.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_kematian.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class Pindah extends StatefulWidget {
  const Pindah({Key key}) : super(key: key);

  @override
  State<Pindah> createState() => _PindahState();
}

final id_surat = TextEditingController();
final tgl_dibuat = TextEditingController();
final no_surat = TextEditingController();
final sifat = TextEditingController();
final lampiran = TextEditingController();
final perihal = TextEditingController();
final nama = TextEditingController();
final tempat_lahir = TextEditingController();
final tanggal_lahir = TextEditingController();
final jenis_kelamin = TextEditingController();
final status = TextEditingController();
final agama = TextEditingController();
final alamat_asal = TextEditingController();
final alamat_tujuan = TextEditingController();
final kelurahan = TextEditingController();
final kecamatan = TextEditingController();
final kabupaten = TextEditingController();
final provinsi = TextEditingController();
final alamat_pindah = TextEditingController();
final pengikut = TextEditingController();
final id_akun = TextEditingController();

class _PindahState extends State<Pindah> {
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

  void verifyPindah() {
    if (nama.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nama harus diisi");
    } else if (tempat_lahir.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tempat Lahir harus diisi");
    } else if (tanggal_lahir.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tanggal Lahir harus diisi");
    } else if (jenis_kelamin.text.isEmpty) {
      Fluttertoast.showToast(msg: "Jenis Kelamin harus diisi");
    } else if (status.text.isEmpty) {
      Fluttertoast.showToast(msg: "Status harus diisi");
    } else if (agama.text.isEmpty) {
      Fluttertoast.showToast(msg: "Agama harus diisi");
    } else if (alamat_asal.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alamat Asal harus diisi");
    } else if (alamat_tujuan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alamat Tujuan harus diisi");
    } else if (kelurahan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Kelurahan harus diisi");
    } else if (kecamatan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Kecamatan harus diisi");
    } else if (kabupaten.text.isEmpty) {
      Fluttertoast.showToast(msg: "Kabupaten harus diisi");
    } else if (provinsi.text.isEmpty) {
      Fluttertoast.showToast(msg: "Profinsi harus diisi");
    } else if (alamat_pindah.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alamat Pindah harus diisi");
    } else if (pengikut.text.isEmpty) {
      Fluttertoast.showToast(msg: "Pengikut harus diisi");
      addData();
    }
  }

  void addData() async {
    // var usr = await RememberUser().getUser();
    // User user = User.fromJson(json.decode(usr));
    await http.post(Uri.parse(ApiConnect.pindah), body: {
      "id_surat": id_surat.text,
      "tgl_dibuat": tgl_dibuat.text,
      "no_surat": no_surat.text,
      "sifat": sifat.text,
      "lampiran": lampiran.text,
      "perihal": perihal.text,
      "nama": nama.text,
      "tempat_lahir": tempat_lahir.text,
      "tanggal_lahir": tanggal_lahir.text,
      "jenis_kelamin": jenis_kelamin.text,
      "status": status.text,
      "agama": agama.text,
      "alamat_asal": alamat_asal.text,
      "alamat_tujuan": alamat_tujuan.text,
      "kelurahan": kelurahan.text,
      "kecamatan": kecamatan.text,
      "kabupaten": kabupaten.text,
      "provinsi": provinsi.text,
      "alamat_pindah": alamat_pindah.text,
      "pengikut": pengikut.text,
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
                hintName: "Nama",
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
                controller: status,
                hintName: "Status",
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
                controller: alamat_asal,
                hintName: "Alamat Asal",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: alamat_tujuan,
                hintName: "Alamat Tujuan",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: kelurahan,
                hintName: "Kelurahan",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: kecamatan,
                hintName: "Kecamatan",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: kabupaten,
                hintName: "Kabupaten",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: provinsi,
                hintName: "Provinsi",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: alamat_pindah,
                hintName: "Alamat Pindah",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: pengikut,
                hintName: "Pengikut",
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
                          verifyPindah();
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
          status.clear();
          agama.clear();
          alamat_asal.clear();
          alamat_tujuan.clear();
          kelurahan.clear();
          kecamatan.clear();
          kabupaten.clear();
          provinsi.clear();
          alamat_pindah.clear();
          pengikut.clear();
        });
        snackBarSucces();
        Navigator.pop(context);
      },
      btnCancelOnPress: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Pindah()));
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
