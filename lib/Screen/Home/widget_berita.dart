import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:kepuharjo_app/Api_connect/Api_connect.dart';
import 'package:kepuharjo_app/Screen/Home/get_detail_berita.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetBerita extends StatefulWidget {
  const WidgetBerita({key});

  @override
  State<WidgetBerita> createState() => _WidgetBeritaState();
}

class Berita {
  final String id_berita;
  final String judul;
  final String sub_title;
  final String dekripsi;

  Berita({
    required this.id_berita,
    required this.judul,
    required this.sub_title,
    required this.dekripsi,
  });
  factory Berita.fromJson(Map<String, dynamic> json) {
    return Berita(
        id_berita: json['id_berita'],
        judul: json['judul'],
        sub_title: json['sub_title'],
        dekripsi: json['dekripsi']);
  }
}

class _WidgetBeritaState extends State<WidgetBerita> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getRequest(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (ctx, index) => Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 15),
                          blurRadius: 22,
                          color: Colors.black.withOpacity(0.10),
                        ),
                        BoxShadow(
                            offset: Offset(-15, -15),
                            blurRadius: 20,
                            color: Colors.white.withOpacity(0.10))
                      ]),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GetDetailBerita(
                                    value: snapshot.data[index].id_berita,
                                  )));
                    },
                    title: Text(
                      snapshot.data[index].judul,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      snapshot.data[index].sub_title,
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 14),
                    ),
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<Berita>> getRequest() async {
    //replace your restFull API here.
    try {
      final response = await http.get(Uri.parse(ApiConnect.berita));
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        List<Berita> news = [];
        for (var i in responseData) {
          Berita brt = Berita(
              id_berita: i["id_berita"],
              judul: i["judul"],
              sub_title: i["sub_title"],
              dekripsi: i["dekripsi"]);

          //Adding user to the list.
          news.add(brt);
        }
        return news;
      } else {
        throw Exception("failed");
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
