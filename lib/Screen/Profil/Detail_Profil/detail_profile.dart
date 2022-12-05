import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Model/User_Model.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_tidakmampu.dart';
import 'package:kepuharjo_app/Screen/Profil/Detail_Profil/widget_list_detail_profile.dart';
import 'package:kepuharjo_app/Shared/shared.dart';
import 'package:http/http.dart' as http;

class DetailProfil extends StatefulWidget {
  const DetailProfil({Key key}) : super(key: key);

  @override
  State<DetailProfil> createState() => _DetailProfilState();
}

class _DetailProfilState extends State<DetailProfil> {
  // User user = User();
  // User get userDetails => userDetails;

  bool circular = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      var response = await http.post(Uri.parse(ApiConnect.signin + "$id_akun"));
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.keyboard_arrow_left),
          ),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'Detail Profil',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: Color(0xFF2A2A72),
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              WidgetDataDetailProfil(),
            ],
          ),
        ),
      ),
    );
  }
}
