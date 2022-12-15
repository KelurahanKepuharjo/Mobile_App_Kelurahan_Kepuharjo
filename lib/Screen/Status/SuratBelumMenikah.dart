import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_service.dart';
import 'package:kepuharjo_app/Model/data_surat_belum_nikah.dart';
import 'package:kepuharjo_app/Screen/Status/Detail/Detail_BelumNikah.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class SuratBelumNikah extends StatefulWidget {
  const SuratBelumNikah({Key key}) : super(key: key);

  @override
  State<SuratBelumNikah> createState() => _SuratBelumNikahState();
}

class _SuratBelumNikahState extends State<SuratBelumNikah> {
  ServiceApi serviceApi = ServiceApi();
  Future<List<cBelumNikah>> listdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata = serviceApi.getbelumnikah();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<cBelumNikah>>(
        future: listdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<cBelumNikah> list = snapshot.data;
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
                            builder: (context) => DetailBelumNikah(
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
                          "Surat Keterangan Belum Nikah",
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
