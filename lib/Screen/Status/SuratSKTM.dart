import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_service.dart';
import 'package:kepuharjo_app/Model/data_surat_tidak_mampu.dart';
import 'package:kepuharjo_app/Screen/Status/Detail/Detail_SKTM.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class SuratSKTM extends StatefulWidget {
  const SuratSKTM({Key key}) : super(key: key);

  @override
  State<SuratSKTM> createState() => _SuratSKTMState();
}

class _SuratSKTMState extends State<SuratSKTM> {
  ServiceApi serviceApi = ServiceApi();
  Future<List<cSktm>> listdata;

  void dataSktm() {
    listdata = serviceApi.getSktm();
  }

  FutureOr onGoing(dynamic value) {
    dataSktm();
  }

  void navigatorSktm(List list, int index) {
    Route route = MaterialPageRoute(
        builder: (context) => DetailSKTM(
              list: list,
              index: index,
            ));
    Navigator.push(context, route).then(onGoing);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataSktm();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<cSktm>>(
        future: listdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<cSktm> list = snapshot.data;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        onTap: () {
                          navigatorSktm(list, index);
                        },
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
                              fontSize: 14,
                              color: blackColor,
                              fontWeight: FontWeight.w300),
                        ),
                        trailing: Container(
                          height: 30,
                          width: 130,
                          decoration: BoxDecoration(
                            color: appColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              list[index].statusSurat,
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: appColor,
                              ),
                            ),
                          ),
                        ),
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
    );
  }
}
