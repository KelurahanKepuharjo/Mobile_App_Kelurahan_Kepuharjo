import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Model/data_surat_tidak_mampu.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class DetailSKTM extends StatefulWidget {
  List<cSktm> list;
  int index;
  DetailSKTM({this.list, this.index});

  @override
  State<DetailSKTM> createState() => _DetailSKTMState();
}

class _DetailSKTMState extends State<DetailSKTM> {
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
                "Status Perkawinan : ${widget.list[widget.index].status}"),
            getDetailSurat(
                "Pekerjaan : ${widget.list[widget.index].pekerjaan}"),
            getDetailSurat("NIK : ${widget.list[widget.index].nik}"),
            getDetailSurat("Alamat : ${widget.list[widget.index].alamat}"),
            getDetailSurat(
                "Tanggal Pengajuan : ${widget.list[widget.index].tglPengajuan}"),
            getDetailSurat("RT : ${widget.list[widget.index].rT}"),
            getDetailSurat("RW : ${widget.list[widget.index].rW}"),
            getDetailSurat(
                "Keperluan : ${widget.list[widget.index].keperluan}"),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Ajukan Pembatalan",
                style: poppinsMediumBlack.copyWith(
                  color: Color(0xFF2A2A72),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
