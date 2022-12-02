class User {
  String? idAkun;
  String? namaLengkap;
  String? password;
  String? noHp;

  User({this.idAkun, this.namaLengkap, this.password, this.noHp});

  User.fromJson(Map<String, dynamic> json) {
    idAkun = json['id_akun'];
    namaLengkap = json['nama_lengkap'];
    password = json['password'];
    noHp = json['no_hp'];
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
