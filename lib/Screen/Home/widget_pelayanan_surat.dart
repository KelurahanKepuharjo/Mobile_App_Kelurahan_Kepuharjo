import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:kepuharjo_app/OrderStatus.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/Domisili.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_akta_kelahiran.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_belum_menikah.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_berkelakuan_baik.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_kematian.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_usaha.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratPengajuan/sAkta.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratPengajuan/sBelumNikah.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratPengajuan/sBerkelakuanBaik.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratPengajuan/sDomisili.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratPengajuan/sSktm.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/SuratPengajuan/sUsaha.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/appearance_pengajuan.dart';
import 'package:kepuharjo_app/Shared/shared.dart';
import 'package:provider/provider.dart';

class WidgetPelayananSurat extends StatefulWidget {
  const WidgetPelayananSurat({Key key}) : super(key: key);

  @override
  State<WidgetPelayananSurat> createState() => _WidgetPelayananSuratState();
}

class _WidgetPelayananSuratState extends State<WidgetPelayananSurat> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 165,
          child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            children: [
              getMenu("Tidak Mampu", Icons.assignment, 0),
              getMenu("Usaha", Icons.home_work, 1),
              getMenu("Kematian", Icons.add_box_outlined, 2),
              getMenu("Domisili", Icons.location_on, 3),
              getMenu("Belum Nikah", Icons.diamond, 4),
              getMenu("Kenal Lahir", Icons.child_friendly, 5),
              getMenu("Berkelakuan Baik", Icons.people_alt, 6),
              getMenu("Lainnya", Icons.grid_view_rounded, 7)
            ],
          )),
    );
  }

  Consumer getMenu(String text, IconData icon, int i) {
    return Consumer<OrderStatus>(
      builder: (context, orderStatus, child) {
        return GestureDetector(
          onTap: () {
            if (i == 0) {
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
            if (i == 1) {
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
            if (i == 2) {
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
            if (i == 3) {
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
            if (i == 4) {
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
            if (i == 5) {
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
            if (i == 6) {
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
                        builder: (context) =>
                            const PengajuanBerkelakuanBaik()));
              }
            }
            if (i == 7) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AppearancePengajuan()));
            }
          },
          child: Column(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: greyColor.withOpacity(0.5)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        color: Color(0xff102286),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: poppinsSmallBlack.copyWith(
                      fontSize: 11, fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
