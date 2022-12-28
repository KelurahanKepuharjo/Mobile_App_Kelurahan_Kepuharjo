import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Api/Api_service.dart';
import 'package:kepuharjo_app/OrderStatus.dart';
import 'package:path/path.dart';
import 'package:kepuharjo_app/Model/data_surat_akta_kelahiran.dart';
import 'package:kepuharjo_app/Screen/Status/Pdf/Pdf_Akta.dart';
import 'package:kepuharjo_app/Shared/shared.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class AktaSelesai extends StatefulWidget {
  const AktaSelesai({Key key}) : super(key: key);

  @override
  State<AktaSelesai> createState() => _AktaSelesaiState();
}

class _AktaSelesaiState extends State<AktaSelesai> {
  ServiceApi serviceApi = ServiceApi();
  Future<List<cAkta>> listdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata = serviceApi.getAktaSelesai();
  }

  Future<File> _getFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    if (kDebugMode) {
      print('$file');
    }
    return file;
  }

  Future<File> loadPdf(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    return _getFile(url, bytes);
  }

  void openPdf(BuildContext context, File file, String url) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PdfAkta(
            file: file,
            url: url,
          ),
        ),
      );

  Future<void> downloadPdf(String pdfUrl, String fileName) async {
    final directory = await getExternalStorageDirectory();
    final filePath = '${directory.path}/$fileName';

    try {
      http.Response response = await http.get(Uri.parse(pdfUrl));
      if (response.statusCode == 200) {
        await File(filePath).writeAsBytes(response.bodyBytes);
        print('PDF saved to $filePath');
        OpenFile.open(filePath);
      }
    } catch (e) {
      print(e);
    }
  }

  bool downloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.keyboard_arrow_left),
        ),
        title: Text(
          'Unduh Surat',
          style: GoogleFonts.poppins(
              color: whiteColor, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        shadowColor: Colors.transparent,
      ),
      body: Container(
        color: Colors.white,
        child: downloading
            ? Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: appColor.withOpacity(0.9)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Download",
                        textAlign: TextAlign.center,
                        style: poppinsMediumBlack.copyWith(color: whiteColor),
                      ),
                      SpinKitCircle(
                        color: whiteColor,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              )
            : Expanded(
                child: FutureBuilder<List<cAkta>>(
                  future: listdata,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<cAkta> list = snapshot.data;
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
                                  onTap: () async {
                                    Provider.of<OrderStatus>(context,
                                            listen: false)
                                        .setInProgress(false, 'Akta');
                                    final file = await loadPdf(
                                        ApiConnect.viewpdf +
                                            list[index].pdffile);
                                    // ignore: use_build_context_synchronously
                                    openPdf(
                                        context,
                                        file,
                                        ApiConnect.viewpdf +
                                            list[index].pdffile);
                                  },
                                  leading: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: appColor.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Icon(
                                        Icons.picture_as_pdf_rounded,
                                        color: appColor,
                                        size: 20,
                                      )),
                                  title: Text(
                                    list[index].namaAnak,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: blackColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    "Surat Keterangan Akta Kelahiran",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: blackColor,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  trailing: InkWell(
                                    onTap: () async {
                                      Provider.of<OrderStatus>(context,
                                              listen: false)
                                          .setInProgress(false, 'Akta');
                                      var permissionStatus = await Permission
                                          .storage
                                          .request()
                                          .isGranted;
                                      if (permissionStatus) {
                                        setState(() {
                                          downloading = true;
                                        });
                                        await downloadPdf(
                                            ApiConnect.viewpdf +
                                                list[index].pdffile,
                                            list[index].pdffile);
                                        setState(() {
                                          downloading = false;
                                        });
                                      }
                                    },
                                    child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: appColor.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Icon(
                                          Icons.download,
                                          color: appColor,
                                          size: 20,
                                        )),
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
              ),
      ),
    );
  }
}
