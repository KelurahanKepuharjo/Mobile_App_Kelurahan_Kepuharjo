import 'dart:convert';

import 'package:get/get.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Controller/Current_UserLogin.dart';
import 'package:kepuharjo_app/Model/News_Model.dart';
import 'package:http/http.dart' as http;
import 'package:kepuharjo_app/Model/data_surat_domisili.dart';
import 'package:kepuharjo_app/Model/data_surat_tidak_mampu.dart';

class ServiceApiNews {
  //get data berita
  Future<List<cNews>> getNews() async {
    final response = await http.get(Uri.parse(ApiConnect.berita));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => cNews.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  final CurrentUser _currentUser = Get.put(CurrentUser());
  Future<List<cSktm>> getSktm() async {
    final response = await http.post(Uri.parse(ApiConnect.readsktm), body: {
      "id_akun": _currentUser.user.idAkun,
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => cSktm.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<List<cDomisili>> getDomisili() async {
    final response = await http.post(Uri.parse(ApiConnect.readdomisili), body: {
      "id_akun": _currentUser.user.idAkun,
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => cDomisili.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }
}
