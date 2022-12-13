class cSktm {
  String idSurat;
  String noSurat;
  String nama;
  String tempatlahir;
  String tanggalLahir;
  String jenisKelamin;
  String kebangsaan;
  String agama;
  String status;
  String pekerjaan;
  String nik;
  String alamat;
  String noPengantar;
  String tglPengajuan;
  String keterangan;
  String keperluan;
  String tglDibuat;
  String statusSurat;
  String image;
  String idAkun;

  cSktm(
      {this.idSurat,
      this.noSurat,
      this.nama,
      this.tempatlahir,
      this.tanggalLahir,
      this.jenisKelamin,
      this.kebangsaan,
      this.agama,
      this.status,
      this.pekerjaan,
      this.nik,
      this.alamat,
      this.noPengantar,
      this.tglPengajuan,
      this.keterangan,
      this.keperluan,
      this.tglDibuat,
      this.statusSurat,
      this.image,
      this.idAkun});

  cSktm.fromJson(Map<String, dynamic> json) {
    idSurat = json['id_surat'];
    noSurat = json['no_surat'];
    nama = json['nama'];
    tempatlahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    kebangsaan = json['kebangsaan'];
    agama = json['agama'];
    status = json['status'];
    pekerjaan = json['pekerjaan'];
    nik = json['nik'];
    alamat = json['alamat'];
    noPengantar = json['no_pengantar'];
    tglPengajuan = json['tgl_pengajuan'];
    keterangan = json['keterangan'];
    keperluan = json['keperluan'];
    tglDibuat = json['tgl_dibuat'];
    statusSurat = json['status_surat'];
    image = json['image'];
    idAkun = json['id_akun'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_surat'] = this.idSurat;
    data['no_surat'] = this.noSurat;
    data['nama'] = this.nama;
    data['tempat_lahir'] = this.tempatlahir;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['kebangsaan'] = this.kebangsaan;
    data['agama'] = this.agama;
    data['status'] = this.status;
    data['pekerjaan'] = this.pekerjaan;
    data['nik'] = this.nik;
    data['alamat'] = this.alamat;
    data['no_pengantar'] = this.noPengantar;
    data['tgl_pengajuan'] = this.tglPengajuan;
    data['keterangan'] = this.keterangan;
    data['keperluan'] = this.keperluan;
    data['tgl_dibuat'] = this.tglDibuat;
    data['status_surat'] = this.statusSurat;
    data['image'] = this.image;
    data['id_akun'] = this.idAkun;
    return data;
  }
}
