import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_service.dart';
import 'package:kepuharjo_app/Model/data_surat_akta_kelahiran.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class AktaSelesai extends StatefulWidget {
  const AktaSelesai({Key key}) : super(key: key);

  @override
  State<AktaSelesai> createState() => _AktaSelesaiState();
}

class _AktaSelesaiState extends State<AktaSelesai> {
  ServiceApi serviceApi = ServiceApi();
  Future<List<cAkta>> listdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata = serviceApi.getAktaSelesai();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.keyboard_arrow_left),
        ),
        title: Text(
          'Surat Keterangan Akta Kelahiran',
          style: GoogleFonts.poppins(
              color: whiteColor, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        shadowColor: Colors.transparent,
      ),
      body: Container(
        color: Colors.white,
        child: Expanded(
          child: FutureBuilder<List<cAkta>>(
            future: listdata,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<cAkta> list = snapshot.data;
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
                            leading: Icon(Icons.picture_as_pdf_rounded),
                            title: Text(
                              list[index].namaAnak,
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: blackColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Surat Keterangan Akta Kelahiran",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: blackColor,
                                  fontWeight: FontWeight.w300),
                            ),
                            trailing: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: appColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Icons.download,
                                  color: appColor,
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