class User {
  String idAkun;
  String namaLengkap;
  String password;
  String noHp;
  String hakAkses;
  String rT;
  String rW;

  User(
      {this.idAkun,
      this.namaLengkap,
      this.password,
      this.noHp,
      this.hakAkses,
      this.rT,
      this.rW});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idAkun: json['id_akun'],
      namaLengkap: json['nama_lengkap'],
      password: json['password'],
      noHp: json['no_hp'],
      hakAkses: json['hak_akses'],
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
    data['hak_akses'] = this.hakAkses;
    data['rt'] = this.rT;
    data['rw'] = this.rW;
    return data;
  }
}
