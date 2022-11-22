class UserModel {
  int id_pengaju;
  String nama_lengkap;
  String tlp;
  String password;

  UserModel(
    this.id_pengaju,
    this.nama_lengkap,
    this.tlp,
    this.password,
  );

  Map<String, dynamic> toJson() => {
        'id_pengaju': id_pengaju,
        'nama_lengkap': nama_lengkap,
        'tlp': tlp,
        'password': password,
      };
}
