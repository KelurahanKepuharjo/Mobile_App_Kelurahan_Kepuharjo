import 'dart:convert';

import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:kepuharjo_app/Model/News_Model.dart';
import 'package:http/http.dart' as http;

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
}
