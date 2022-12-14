import 'package:flutter/material.dart';

class User {
  String idAkun;
  String namaLengkap;
  String password;
  String noHp;
  String rT;
  String rW;

  User(
      {this.idAkun,
      this.namaLengkap,
      this.password,
      this.noHp,
      this.rT,
      this.rW});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idAkun: json['id_akun'],
      namaLengkap: json['nama_lengkap'],
      password: json['password'],
      noHp: json['no_hp'],
      rT: json['rt'],
      rW: json['rw'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_akun'] = this.idAkun;
    data['nama_lengkap'] = this.namaLengkap;
    data['password'] = this.password;
    data['no_hp'] = this.noHp;
    data['rt'] = this.rT;
    data['rw'] = this.rW;
    return data;
  }
}
