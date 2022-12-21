import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Api/Api_service.dart';
import 'package:kepuharjo_app/Model/data_surat_tidak_mampu.dart';
import 'package:kepuharjo_app/Screen/Status/Pdf/Pdf_Sktm.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class SktmSelesai extends StatefulWidget {
  const SktmSelesai({Key key}) : super(key: key);

  @override
  State<SktmSelesai> createState() => _SktmSelesaiState();
}

class _SktmSelesaiState extends State<SktmSelesai> {
  ServiceApi serviceApi = ServiceApi();
  Future<List<cSktm>> listdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata = serviceApi.getSktmSelesai();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.keyboard_arrow_left),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          'Surat Keterangan Tidak Mampu',
          style: GoogleFonts.poppins(
              color: whiteColor, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Expanded(
          child: FutureBuilder<List<cSktm>>(
            future: listdata,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<cSktm> list = snapshot.data;
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PdfSktm(
                                        url:
                                            // ignore: prefer_interpolation_to_compose_strings
                                            "http://192.168.0.117/Web_Kelurahan_Kepuharjo/pdf/" +
                                                list[index].pdffile),
                                  ));
                            },
                            leading: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: appColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Icons.picture_as_pdf_rounded,
                                  color: appColor,
                                  size: 20,
                                )),
                            title: Text(
                              list[index].nama,
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: blackColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Surat Keterangan Tidak Mampu",
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: blackColor,
                                  fontWeight: FontWeight.w300),
                            ),
                            trailing: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: appColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Icons.download,
                                  color: appColor,
                                  size: 20,
                                )),
                          ),
                          const Divider(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.data}");
              }
              return Center(
                child: CircularProgressIndicator(color: appColor),
              );
            },
          ),
        ),
      ),
    );
  }
}
