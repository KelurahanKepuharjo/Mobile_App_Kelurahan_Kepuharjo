class UserModel {
  String id_akun;
  String nama_lengkap;
  String password;
  String no_hp;

  UserModel(
    this.id_akun,
    this.nama_lengkap,
    this.password,
    this.no_hp,
  );

  Map<String, dynamic> toJson() => {
        'id_akun': id_akun,
        'nama_lengkap': nama_lengkap,
        'password': password,
        'no_hp': no_hp,
      };

  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(
  //     json['id_akun'],
  //     json['nama_lengkap'],
  //     json['password'],
  //     json['no_hp'],
  //   );
  // }
}
