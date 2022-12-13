class cUsaha {
  String idSurat;
  String noSurat;
  String nama;
  String tempatLahir;
  String tanggalLahir;
  String jenisKelamin;
  String kebangsaan;
  String agama;
  String status;
  String pekerjaan;
  String nik;
  String alamat;
  String namaUsaha;
  String keperluan;
  String tglSuratDibuat;
  String image;
  String statusSurat;
  String tglPengajuan;
  String idAkun;

  cUsaha(
      {this.idSurat,
      this.noSurat,
      this.nama,
      this.tempatLahir,
      this.tanggalLahir,
      this.jenisKelamin,
      this.kebangsaan,
      this.agama,
      this.status,
      this.pekerjaan,
      this.nik,
      this.alamat,
      this.namaUsaha,
      this.keperluan,
      this.tglSuratDibuat,
      this.image,
      this.statusSurat,
      this.tglPengajuan,
      this.idAkun});

  cUsaha.fromJson(Map<String, dynamic> json) {
    idSurat = json['id_surat'];
    noSurat = json['no_surat'];
    nama = json['nama'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    kebangsaan = json['kebangsaan'];
    agama = json['agama'];
    status = json['status'];
    pekerjaan = json['pekerjaan'];
    nik = json['nik'];
    alamat = json['alamat'];
    namaUsaha = json['nama_usaha'];
    keperluan = json['keperluan'];
    tglSuratDibuat = json['tgl_surat_dibuat'];
    image = json['image'];
    statusSurat = json['status_surat'];
    tglPengajuan = json['tgl_pengajuan'];
    idAkun = json['id_akun'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_surat'] = this.idSurat;
    data['no_surat'] = this.noSurat;
    data['nama'] = this.nama;
    data['tempat_lahir'] = this.tempatLahir;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['kebangsaan'] = this.kebangsaan;
    data['agama'] = this.agama;
    data['status'] = this.status;
    data['pekerjaan'] = this.pekerjaan;
    data['nik'] = this.nik;
    data['alamat'] = this.alamat;
    data['nama_usaha'] = this.namaUsaha;
    data['keperluan'] = this.keperluan;
    data['tgl_surat_dibuat'] = this.tglSuratDibuat;
    data['image'] = this.image;
    data['status_surat'] = this.statusSurat;
    data['tgl_pengajuan'] = this.tglPengajuan;
    data['id_akun'] = this.idAkun;
    return data;
  }
}
