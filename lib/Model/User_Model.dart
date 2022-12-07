import 'package:flutter/material.dart';

class User {
  String idAkun;
  String namaLengkap;
  String password;
  String noHp;

  User(
      {@required this.idAkun,
      @required this.namaLengkap,
      @required this.password,
      @required this.noHp});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idAkun: json['id_akun'],
      namaLengkap: json['nama_lengkap'],
      password: json['password'],
      noHp: json['no_hp'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_akun'] = this.idAkun;
    data['nama_lengkap'] = this.namaLengkap;
    data['password'] = this.password;
    data['no_hp'] = this.noHp;
    return data;
  }
}
