import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_service.dart';
import 'package:kepuharjo_app/Model/data_surat_domisili.dart';
import 'package:kepuharjo_app/Screen/Status/Detail/Detail_Domisili.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class DomisiliSelesai extends StatefulWidget {
  const DomisiliSelesai({Key key}) : super(key: key);

  @override
  State<DomisiliSelesai> createState() => _DomisiliSelesaiState();
}

class _DomisiliSelesaiState extends State<DomisiliSelesai> {
  ServiceApi serviceApi = ServiceApi();
  Future<List<cDomisili>> listdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata = serviceApi.getDomisiliSelesai();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        color: whiteColor,
        child: Expanded(
          child: FutureBuilder<List<cDomisili>>(
            future: listdata,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<cDomisili> list = snapshot.data;
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
                            title: Text(
                              list[index].nama,
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: blackColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Surat Keterangan Domisili",
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
                child: CircularProgressIndicator(
                  color: appColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
