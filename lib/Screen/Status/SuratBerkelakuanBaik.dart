import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_service.dart';
import 'package:kepuharjo_app/Model/data_surat_berkelakuanbaik.dart';
import 'package:kepuharjo_app/Screen/Status/Detail/Detail_BerkelakuanBaik.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class SuratBerkelakuanBaik extends StatefulWidget {
  const SuratBerkelakuanBaik({Key key}) : super(key: key);

  @override
  State<SuratBerkelakuanBaik> createState() => _SuratBerkelakuanBaikState();
}

class _SuratBerkelakuanBaikState extends State<SuratBerkelakuanBaik> {
  ServiceApi serviceApi = ServiceApi();
  Future<List<cBerkelakuanBaik>> listdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata = serviceApi.getBerkelakuanBaik();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<cBerkelakuanBaik>>(
        future: listdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<cBerkelakuanBaik> list = snapshot.data;
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
                            builder: (context) => DetailBerkelakuanBaik(
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
                          list[index].nik,
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
