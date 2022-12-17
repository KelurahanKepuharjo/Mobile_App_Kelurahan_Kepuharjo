import 'dart:convert';

import 'package:get/get.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Controller/Current_UserLogin.dart';
import 'package:kepuharjo_app/Model/News_Model.dart';
import 'package:http/http.dart' as http;
import 'package:kepuharjo_app/Model/data_surat_akta_kelahiran.dart';
import 'package:kepuharjo_app/Model/data_surat_belum_nikah.dart';
import 'package:kepuharjo_app/Model/data_surat_domisili.dart';
import 'package:kepuharjo_app/Model/data_surat_kematian.dart';
import 'package:kepuharjo_app/Model/data_surat_pindah.dart';
import 'package:kepuharjo_app/Model/data_surat_tidak_mampu.dart';
import 'package:kepuharjo_app/Model/data_surat_usaha.dart';

class ServiceApi {
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

  //get data user login
  final CurrentUser _currentUser = Get.put(CurrentUser());

  //get data surat sktm
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

  //get data surat sktm selesai
  Future<List<cSktm>> getSktmSelesai() async {
    final response =
        await http.post(Uri.parse(ApiConnect.readsktmSelesai), body: {
      "id_akun": _currentUser.user.idAkun,
      "status_surat": "Selesai",
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => cSktm.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  //get data surat keterangan domisili
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

  //get data surat keterangan domisili selesai
  Future<List<cDomisili>> getDomisiliSelesai() async {
    final response =
        await http.post(Uri.parse(ApiConnect.readdomisiliSelesai), body: {
      "id_akun": _currentUser.user.idAkun,
      "status_surat": "Selesai",
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => cDomisili.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  //get data surat keterangan kematian
  Future<List<cKematian>> getkematian() async {
    final response = await http.post(Uri.parse(ApiConnect.readkematian), body: {
      "id_akun": _currentUser.user.idAkun,
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => cKematian.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  //get data surat keterangan kematian selesai
  Future<List<cKematian>> getkematianSelesai() async {
    final response =
        await http.post(Uri.parse(ApiConnect.readkematianSelesai), body: {
      "id_akun": _currentUser.user.idAkun,
      "status_surat": "Selesai",
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => cKematian.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  //get surat keterangan pindah
  Future<List<cPindah>> getpindah() async {
    final response = await http.post(Uri.parse(ApiConnect.readpindah), body: {
      "id_akun": _currentUser.user.idAkun,
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => cPindah.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  //get surat keterangan pindah selesai
  Future<List<cPindah>> getpindahSelesai() async {
    final response =
        await http.post(Uri.parse(ApiConnect.readpindahSelesai), body: {
      "id_akun": _currentUser.user.idAkun,
      "status_surat": "Selesai",
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => cPindah.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  //get surat keterangan belum menikah
  Future<List<cBelumNikah>> getbelumnikah() async {
    final response =
        await http.post(Uri.parse(ApiConnect.readbelumNikah), body: {
      "id_akun": _currentUser.user.idAkun,
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => cBelumNikah.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  //get surat keterangan belum menikah selesai
  Future<List<cBelumNikah>> getbelumnikahSelesai() async {
    final response =
        await http.post(Uri.parse(ApiConnect.readbelumNikahSelesai), body: {
      "id_akun": _currentUser.user.idAkun,
      "status_surat": "Selesai",
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => cBelumNikah.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  //get surat keterangan usaha
  Future<List<cUsaha>> getusaha() async {
    final response = await http.post(Uri.parse(ApiConnect.readUsaha), body: {
      "id_akun": _currentUser.user.idAkun,
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => cUsaha.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  //get surat keterangan usaha selesai
  Future<List<cUsaha>> getusahaSelesai() async {
    final response =
        await http.post(Uri.parse(ApiConnect.readUsahaSelesai), body: {
      "id_akun": _currentUser.user.idAkun,
      "status_surat": "Selesai",
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => cUsaha.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  //get surat keterangan akta kelahiran
  Future<List<cAkta>> getAkta() async {
    final response = await http.post(Uri.parse(ApiConnect.readakta), body: {
      "id_akun": _currentUser.user.idAkun,
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => cAkta.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  //get surat keterangan akta kelahiran selesai
  Future<List<cAkta>> getAktaSelesai() async {
    final response =
        await http.post(Uri.parse(ApiConnect.readaktaSelesai), body: {
      "id_akun": _currentUser.user.idAkun,
      "status_surat": "Selesai",
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => cAkta.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }
}
