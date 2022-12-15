import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_service.dart';
import 'package:kepuharjo_app/Model/data_surat_pindah.dart';
import 'package:kepuharjo_app/Screen/Status/Detail/Detail_Pindah.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class SuratPindah extends StatefulWidget {
  const SuratPindah({Key key}) : super(key: key);

  @override
  State<SuratPindah> createState() => _SuratPindahState();
}

class _SuratPindahState extends State<SuratPindah> {
  ServiceApi serviceApi = ServiceApi();
  Future<List<cPindah>> listdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata = serviceApi.getpindah();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<cPindah>>(
        future: listdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<cPindah> list = snapshot.data;
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
                            builder: (context) => DetailPindah(
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
                          "Surat Keterangan Pindah",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: blackColor,
                              fontWeight: FontWeight.w300),
                        ),
                        trailing: Container(
                          height: 30,
                          width: 130,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A2A72).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              list[index].statusSurat,
                              style: GoogleFonts.poppins(
                                fontSize: 11,
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
