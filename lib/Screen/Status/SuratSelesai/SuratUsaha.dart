import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Api/Api_service.dart';
import 'package:kepuharjo_app/Model/data_surat_usaha.dart';
import 'package:kepuharjo_app/Screen/Status/Pdf/Pdf_Usaha.dart';
import 'package:kepuharjo_app/Shared/shared.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class UsahaSelesai extends StatefulWidget {
  const UsahaSelesai({Key key}) : super(key: key);

  @override
  State<UsahaSelesai> createState() => _UsahaSelesaiState();
}

class _UsahaSelesaiState extends State<UsahaSelesai> {
  ServiceApi serviceApi = ServiceApi();
  Future<List<cUsaha>> listdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata = serviceApi.getusahaSelesai();
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
          builder: (context) => PdfUsaha(
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
        backgroundColor: appColor,
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.keyboard_arrow_left),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          'Unduh Surat',
          style: GoogleFonts.poppins(
              color: whiteColor, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: whiteColor,
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
                child: FutureBuilder<List<cUsaha>>(
                  future: listdata,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<cUsaha> list = snapshot.data;
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
                                  trailing: InkWell(
                                    onTap: () async {
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
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: appColor.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Icon(
                                          Icons.download,
                                          color: appColor,
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
