class UserModel {
  String id_pengaju;
  String nama_lengkap;
  String telepon;
  String password;

  UserModel(
    this.id_pengaju,
    this.nama_lengkap,
    this.telepon,
    this.password,
  );

  Map<String, dynamic> toJson() => {
        'id_pengaju': id_pengaju,
        'nama_lengkap': nama_lengkap,
        'telepon': telepon,
        'password': password,
      };
}
