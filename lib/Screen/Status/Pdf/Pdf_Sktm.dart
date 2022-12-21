import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class PdfSktm extends StatefulWidget {
  String url;

  PdfSktm({Key key, this.url}) : super(key: key);

  @override
  State<PdfSktm> createState() => _PdfSktmState();
}

class _PdfSktmState extends State<PdfSktm> {
  bool loading = true;
  PDFDocument pdfDocument;

  loadPdf() async {
    pdfDocument = await PDFDocument.fromURL(widget.url);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: appColor,
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                color: appColor,
              ),
            )
          : PDFViewer(
              document: pdfDocument,
            ),
    );
  }
}
