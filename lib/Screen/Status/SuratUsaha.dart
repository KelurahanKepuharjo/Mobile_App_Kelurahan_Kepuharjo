import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_service.dart';
import 'package:kepuharjo_app/Model/data_surat_usaha.dart';
import 'package:kepuharjo_app/Screen/Status/Detail/Detail_Usaha.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class SuratUsaha extends StatefulWidget {
  const SuratUsaha({Key key}) : super(key: key);

  @override
  State<SuratUsaha> createState() => _SuratUsahaState();
}

class _SuratUsahaState extends State<SuratUsaha> {
  ServiceApi serviceApi = ServiceApi();
  Future<List<cUsaha>> listdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata = serviceApi.getusaha();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<cUsaha>>(
        future: listdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<cUsaha> list = snapshot.data;
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
                            builder: (context) => DetailUsaha(
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
                          "Surat Keterangan Usaha",
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
