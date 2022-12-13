import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_service.dart';
import 'package:kepuharjo_app/Model/data_surat_domisili.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class SuratDomisili extends StatefulWidget {
  const SuratDomisili({Key key}) : super(key: key);

  @override
  State<SuratDomisili> createState() => _SuratDomisiliState();
}

class _SuratDomisiliState extends State<SuratDomisili> {
  ServiceApiNews serviceApi = ServiceApiNews();
  Future<List<cDomisili>> listdataDomisili;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdataDomisili = serviceApi.getDomisili();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<cDomisili>>(
        future: listdataDomisili,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<cDomisili> isiData = snapshot.data;
            return ListView.builder(
              itemCount: isiData.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        title: Text(
                          isiData[index].nama,
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
                          height: 20,
                          width: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A2A72).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              isiData[index].statusSurat,
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
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
