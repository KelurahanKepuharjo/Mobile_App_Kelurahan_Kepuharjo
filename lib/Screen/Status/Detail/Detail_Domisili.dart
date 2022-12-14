import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Model/data_surat_domisili.dart';
import 'package:kepuharjo_app/Screen/NavButton/Home_Screen.dart';
import 'package:kepuharjo_app/Shared/shared.dart';
import 'package:http/http.dart' as http;

class DetailDomisili extends StatefulWidget {
  List<cDomisili> list;
  int index;
  DetailDomisili({this.list, this.index});

  @override
  State<DetailDomisili> createState() => _DetailDomisiliState();
}

class _DetailDomisiliState extends State<DetailDomisili> {
  Container getDetailSurat(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: const Color.fromARGB(179, 234, 234, 234),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: poppinsSmallBlack,
          ),
        ],
      ),
    );
  }

  void pembatalanSurat() async {
    if (widget.list[widget.index].statusSurat == "Diajukan") {
      try {
        var url = Uri.parse(ApiConnect.pembatalanDomisili);
        var response = await http.post(url, body: {
          "id_surat": widget.list[widget.index].idSurat,
          "status_surat": pembatalan,
        });
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          if (data['success'] == true) {
            Fluttertoast.showToast(
                backgroundColor: Colors.green,
                msg: "Pengajuan Pembatalan Surat Berhasil");
          }
        }
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    } else {
      Fluttertoast.showToast(
          backgroundColor: Colors.red, msg: "Pengajuan Pembatalan Surat Gagal");
    }
  }

  showSuccessDialog() {
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.WARNING,
      title: 'Warning!',
      titleTextStyle: poppinsLargeBlack.copyWith(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF2A2A72)),
      desc: 'Apakah anda yakin, untuk membatalkan pengajuan surat anda ?',
      descTextStyle: nunitoMediumBlack.copyWith(color: Colors.grey),
      btnOkOnPress: () {
        pembatalanSurat();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
      },
      btnOkIcon: Icons.done,
    ).show();
  }

  String pembatalan = "Proses Pembatalan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'Detail Pengajuan',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/newbgsa.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: Color(0xFF2A2A72),
        )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            getDetailSurat("Nama : ${widget.list[widget.index].nama}"),
            getDetailSurat(
                "Tempat Lahir : ${widget.list[widget.index].tempatLahir}"),
            getDetailSurat(
                "Tanggal Lahir : ${widget.list[widget.index].tanggalLahir}"),
            getDetailSurat(
                "Jenis Kelamin : ${widget.list[widget.index].jenisKelamin}"),
            getDetailSurat(
                "Kebangsaan : ${widget.list[widget.index].kebangsaan}"),
            getDetailSurat("Agama : ${widget.list[widget.index].agama}"),
            getDetailSurat(
                "Status Perkawinan : ${widget.list[widget.index].statusPerkawinan}"),
            getDetailSurat(
                "Pekerjaan : ${widget.list[widget.index].pekerjaan}"),
            getDetailSurat("NIK : ${widget.list[widget.index].nik}"),
            getDetailSurat("Alamat : ${widget.list[widget.index].alamat}"),
            getDetailSurat("RT : ${widget.list[widget.index].rT}"),
            getDetailSurat("RW : ${widget.list[widget.index].rW}"),
            getDetailSurat(
                "surat digunakan untuk : ${widget.list[widget.index].suratDigunakanUntuk}"),
            Visibility(
                visible: widget.list[widget.index].statusSurat != "Selesai",
                child: TextButton(
                  onPressed: () {
                    showSuccessDialog();
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: appColor),
                        color: appColor.withOpacity(0.1)),
                    child: Center(
                      child: Text(
                        "Ajukan Pembatalan",
                        textAlign: TextAlign.center,
                        style: poppinsMediumBlack.copyWith(color: appColor),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
