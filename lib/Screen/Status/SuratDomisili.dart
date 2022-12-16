import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_service.dart';
import 'package:kepuharjo_app/Model/data_surat_domisili.dart';
import 'package:kepuharjo_app/Screen/Status/Detail/Detail_Domisili.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class SuratDomisili extends StatefulWidget {
  const SuratDomisili({Key key}) : super(key: key);

  @override
  State<SuratDomisili> createState() => _SuratDomisiliState();
}

class _SuratDomisiliState extends State<SuratDomisili> {
  ServiceApi serviceApi = ServiceApi();
  Future<List<cDomisili>> listdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata = serviceApi.getDomisili();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<cDomisili>>(
        future: listdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<cDomisili> list = snapshot.data;
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
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailDomisili(
                              list: list,
                              index: index,
                            ),
                          ));
                        },
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
            child: CircularProgressIndicator(
              color: appColor,
            ),
          );
        },
      ),
    );
  }
}
