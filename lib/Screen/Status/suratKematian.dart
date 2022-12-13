import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_service.dart';
import 'package:kepuharjo_app/Model/data_surat_kematian.dart';
import 'package:kepuharjo_app/Screen/Status/Detail/Detail_Kematian.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class SuratKematian extends StatefulWidget {
  const SuratKematian({Key key}) : super(key: key);

  @override
  State<SuratKematian> createState() => _SuratKematianState();
}

class _SuratKematianState extends State<SuratKematian> {
  ServiceApi serviceApi = ServiceApi();
  Future<List<cKematian>> listdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata = serviceApi.getkematian();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<cKematian>>(
        future: listdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<cKematian> list = snapshot.data;
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
                            builder: (context) => DetailKematian(
                              list: list,
                              index: index,
                            ),
                          ));
                        },
                        title: Text(
                          list[index].namaAlmarhum,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: blackColor,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Surat Keterangan Kematian",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: blackColor,
                              fontWeight: FontWeight.w300),
                        ),
                        trailing: Container(
                          height: 20,
                          width: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A2A72).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              list[index].statusSurat,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: const Color(0xFF2A2A72),
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
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFF2A2A72),
            ),
          );
        },
      ),
    );
  }
}
