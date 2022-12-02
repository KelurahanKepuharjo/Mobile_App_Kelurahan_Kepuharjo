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
import 'package:kepuharjo_app/Shared/shared.dart';

class SKTM extends StatefulWidget {
  const SKTM({Key? key}) : super(key: key);

  @override
  State<SKTM> createState() => _SKTMState();
}

final id_akun = TextEditingController();
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

class _SKTMState extends State<SKTM> {
  void verifySKTM() {
    if (nama.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nama Lengkap harus diisi");
    } else if (tempatlahir.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tempat Lahir harus diisi");
    } else if (tgllhir.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tanggal Lahir harus diisi");
    } else if (jk.text.isEmpty) {
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
    } else if (keperluan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Keperluan harus diisi");
    } else {
      addData();
    }
  }

  void addData() {
    http.post(Uri.parse(ApiConnect.sktm), body: {
      "id_akun": id_akun.text,
      "nama": nama.text,
      "tempat_lahir": tempatlahir.text,
      "tanggal_lahir": tgllhir.text,
      "jenis_kelamin": jk.text,
      "kebangsaan": kebangsaan.text,
      "agama": agama.text,
      "status": status.text,
      "profesi": pekerjaan.text,
      "nik": nik.text,
      "alamat": alamat.text,
      "keperluan": keperluan.text,
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
              getTextForm(
                isReadOnly: false,
                controller: id_akun,
                hintName: "Nik anda",
                keyboardType: TextInputType.number,
                inputFormatters: FilteringTextInputFormatter.digitsOnly,
              ),
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
                controller: tempatlahir,
                hintName: "Tempat Lahir",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
              ),
              const SizedBox(height: 5),
              getDateTime(
                controller: tgllhir,
              ),
              const SizedBox(height: 5),
              getTextForm(
                controller: jk,
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
                controller: status,
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
                controller: keperluan,
                hintName: "Keperluan",
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
                          setState(() {
                            verifySKTM();
                            // showSuccessDialog();
                          });
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
      desc: 'Apakah Anda Yakin',
      descTextStyle: nunitoMediumBlack.copyWith(color: Colors.grey),
      btnOkOnPress: () {
        setState(() {
          id_akun.clear();
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
        });
        snackBarSucces();
        Navigator.of(context);
      },
      btnCancelOnPress: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const SKTM()));
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
