import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_service.dart';
import 'package:kepuharjo_app/Model/News_Model.dart';
import 'package:kepuharjo_app/Shared/shared.dart';
import 'package:readmore/readmore.dart';

class WidgetBerita extends StatefulWidget {
  const WidgetBerita({key});

  @override
  State<WidgetBerita> createState() => _WidgetBeritaState();
}

class _WidgetBeritaState extends State<WidgetBerita> {
  ServiceApi serviceApi = ServiceApi();
  Future<List<cNews>> listdata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata = serviceApi.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<cNews>>(
        future: listdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<cNews> isiData = snapshot.data;
            return ListView.builder(
              itemCount: isiData.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 15),
                                blurRadius: 22,
                                color: Colors.black.withOpacity(0.10),
                              ),
                              BoxShadow(
                                  offset: Offset(-15, -15),
                                  blurRadius: 20,
                                  color: Colors.white.withOpacity(0.10))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    isiData[index].judul,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                ],
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      isiData[index].subTitle,
                                      style: poppinsSmallBlack.copyWith(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    ReadMoreText(
                                      isiData[index].dekripsi,
                                      trimLines: 2,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText: "Baca Selengkapnya",
                                      trimExpandedText: "  Lebih Sedikit",
                                      lessStyle: poppinsMediumBlack.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                        color: Color(0xFF2A2A72),
                                      ),
                                      moreStyle: poppinsMediumBlack.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                        color: Color(0xFF2A2A72),
                                      ),
                                      style: poppinsMediumBlack.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                        ),
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
