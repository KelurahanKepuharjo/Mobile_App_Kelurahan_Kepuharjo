import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Model/data_surat_kematian.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class DetailKematian extends StatefulWidget {
  List<cKematian> list;
  int index;
  DetailKematian({this.list, this.index});

  @override
  State<DetailKematian> createState() => _DetailKematianState();
}

class _DetailKematianState extends State<DetailKematian> {
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
            getDetailSurat("Nama Almarhum : ${widget.list[widget.index].namaAlmarhum}"),
            getDetailSurat("Saksi Kematian : ${widget.list[widget.index].saksiKematian}"),
            getDetailSurat("Hubungan : ${widget.list[widget.index].hubungan}"),
            getDetailSurat("Hari : ${widget.list[widget.index].hari}"),
            getDetailSurat("Tanggal : ${widget.list[widget.index].tanggal}"),
            getDetailSurat("Alamat : ${widget.list[widget.index].alamat}"),
            getDetailSurat("Nik Almarhum : ${widget.list[widget.index].nikAlmarhum}"),
            getDetailSurat("Penyebab Kematian : ${widget.list[widget.index].penyebabKematian}"),
            getDetailSurat("RT : ${widget.list[widget.index].rT}"),
            getDetailSurat("RW : ${widget.list[widget.index].rW}"),
            getDetailSurat("surat digunakan : ${widget.list[widget.index].suratDigunakan}"),
          ],
        ),
      ),
    );
  }
}