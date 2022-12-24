import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

import 'package:kepuharjo_app/Shared/shared.dart';

class PdfDomisili extends StatefulWidget {
  String url;
  File file;

  PdfDomisili({Key key, this.url, this.file}) : super(key: key);

  @override
  State<PdfDomisili> createState() => _PdfDomisiliState();
}

class _PdfDomisiliState extends State<PdfDomisili> {
  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          shadowColor: whiteColor,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.keyboard_arrow_left),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: appColor,
          title: Text(name),
        ),
        body: PDFView(
          filePath: widget.file.path,
        ));
  }
}
