import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/OrderStatus.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_kematian.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratPengajuan/sAkta.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratPengajuan/sBelumNikah.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratPengajuan/sBerkelakuanBaik.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratPengajuan/sDomisili.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratPengajuan/sSktm.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratPengajuan/sUsaha.dart';
import 'package:kepuharjo_app/Shared/shared.dart';
import 'package:provider/provider.dart';

class WidgetGridViewSurat extends StatefulWidget {
  const WidgetGridViewSurat({Key key}) : super(key: key);

  @override
  State<WidgetGridViewSurat> createState() => _WidgetGridViewSuratState();
}

Consumer getLetter(
    BuildContext context, String title, int index, IconData icon) {
  return Consumer<OrderStatus>(
    builder: (context, orderStatus, _) {
      return GestureDetector(
        onTap: () {
          if (index == 0) {
            if (orderStatus.currentApplicationType == 'SKTM' &&
                orderStatus.isOrderInProgress == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  behavior: SnackBarBehavior.floating,
                  content: AwesomeSnackbarContent(
                      title: "Gagal",
                      message:
                          'Anda tidak dapat melakukan pengajuan surat,Jika pengajuan sebelumnya masih belum selesai',
                      contentType: ContentType.failure)));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PengajuanSktm()));
            }
          }
          if (index == 1) {
            if (orderStatus.currentApplicationType == 'BelumNikah' &&
                orderStatus.isOrderInProgress == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  behavior: SnackBarBehavior.floating,
                  content: AwesomeSnackbarContent(
                      title: "Gagal",
                      message:
                          'Anda tidak dapat melakukan pengajuan surat,Jika pengajuan sebelumnya masih belum selesai',
                      contentType: ContentType.failure)));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PengajuanBelumNikah()));
            }
          }
          if (index == 2) {
            if (orderStatus.currentApplicationType == 'Domisili' &&
                orderStatus.isOrderInProgress == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  behavior: SnackBarBehavior.floating,
                  content: AwesomeSnackbarContent(
                      title: "Gagal",
                      message:
                          'Anda tidak dapat melakukan pengajuan surat,Jika pengajuan sebelumnya masih belum selesai',
                      contentType: ContentType.failure)));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PengajuanDomisili()));
            }
          }
          if (index == 3) {
            if (orderStatus.currentApplicationType == 'Kematian' &&
                orderStatus.isOrderInProgress == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  behavior: SnackBarBehavior.floating,
                  content: AwesomeSnackbarContent(
                      title: "Gagal",
                      message:
                          'Anda tidak dapat melakukan pengajuan surat,Jika pengajuan sebelumnya masih belum selesai',
                      contentType: ContentType.failure)));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Kematian()));
            }
          }
          if (index == 4) {
            if (orderStatus.currentApplicationType == 'Akta' &&
                orderStatus.isOrderInProgress == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  behavior: SnackBarBehavior.floating,
                  content: AwesomeSnackbarContent(
                      title: "Gagal",
                      message:
                          'Anda tidak dapat melakukan pengajuan surat,Jika pengajuan sebelumnya masih belum selesai',
                      contentType: ContentType.failure)));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PengajuanAkta()));
            }
          }
          if (index == 5) {
            if (orderStatus.currentApplicationType == 'Baik' &&
                orderStatus.isOrderInProgress == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  behavior: SnackBarBehavior.floating,
                  content: AwesomeSnackbarContent(
                      title: "Gagal",
                      message:
                          'Anda tidak dapat melakukan pengajuan surat,Jika pengajuan sebelumnya masih belum selesai',
                      contentType: ContentType.failure)));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PengajuanBerkelakuanBaik()));
            }
          }
          if (index == 6) {
            if (orderStatus.currentApplicationType == 'Usaha' &&
                orderStatus.isOrderInProgress == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  behavior: SnackBarBehavior.floating,
                  content: AwesomeSnackbarContent(
                      title: "Gagal",
                      message:
                          'Anda tidak dapat melakukan pengajuan surat,Jika pengajuan sebelumnya masih belum selesai',
                      contentType: ContentType.failure)));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PengajuanUsaha()));
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                appColor,
                midGreen,
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: whiteColor,
                  size: 40,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: whiteColor,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

class _WidgetGridViewSuratState extends State<WidgetGridViewSurat> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          getLetter(
            context,
            "Surat Keterangan Tidak Mampu",
            0,
            Icons.assignment_outlined,
          ),
          getLetter(
            context,
            "Surat Keterangan Belum Menikah",
            1,
            Icons.diamond,
          ),
          getLetter(
            context,
            "Surat Keterangan Domisili",
            2,
            Icons.location_on,
          ),
          getLetter(
            context,
            "Surat Keterangan Kematian",
            3,
            Icons.add_box_outlined,
          ),
          getLetter(
            context,
            "Surat Keterangan Kenal Lahir",
            4,
            Icons.child_friendly,
          ),
          getLetter(
            context,
            "Surat Keterangan Berkelakuan Baik",
            5,
            Icons.people_alt,
          ),
          getLetter(
            context,
            "Surat Keterangan Usaha",
            6,
            Icons.home_work,
          ),
        ],
      ),
    );
  }
}
