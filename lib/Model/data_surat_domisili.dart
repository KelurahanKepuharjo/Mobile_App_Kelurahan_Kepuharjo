class cDomisili {
  String idSurat;
  String noSurat;
  String nama;
  String tempatLahir;
  String tanggalLahir;
  String jenisKelamin;
  String kebangsaan;
  String agama;
  String statusPerkawinan;
  String pekerjaan;
  String nik;
  String alamat;
  String rT;
  String rW;
  String noPengantarSurat;
  String tglSuratPengantar;
  String alamatDomisiliKelKepu;
  String suratDigunakanUntuk;
  String tglSuratDibuat;
  String statusSurat;
  String images;
  String idAkun;

  cDomisili(
      {this.idSurat,
      this.noSurat,
      this.nama,
      this.tempatLahir,
      this.tanggalLahir,
      this.jenisKelamin,
      this.kebangsaan,
      this.agama,
      this.statusPerkawinan,
      this.pekerjaan,
      this.nik,
      this.alamat,
      this.rT,
      this.rW,
      this.noPengantarSurat,
      this.tglSuratPengantar,
      this.alamatDomisiliKelKepu,
      this.suratDigunakanUntuk,
      this.tglSuratDibuat,
      this.statusSurat,
      this.images,
      this.idAkun});

  cDomisili.fromJson(Map<String, dynamic> json) {
    idSurat = json['id_surat'];
    noSurat = json['no_surat'];
    nama = json['nama'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    kebangsaan = json['kebangsaan'];
    agama = json['agama'];
    statusPerkawinan = json['status_perkawinan'];
    pekerjaan = json['pekerjaan'];
    nik = json['nik'];
    alamat = json['alamat'];
    rT = json['RT'];
    rW = json['RW'];
    noPengantarSurat = json['no_pengantar_surat'];
    tglSuratPengantar = json['tgl_surat_pengantar'];
    alamatDomisiliKelKepu = json['alamat_domisili_kel_kepu'];
    suratDigunakanUntuk = json['surat_digunakan_untuk'];
    tglSuratDibuat = json['tgl_surat_dibuat'];
    statusSurat = json['status_surat'];
    images = json['images'];
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
    data['status_perkawinan'] = this.statusPerkawinan;
    data['pekerjaan'] = this.pekerjaan;
    data['nik'] = this.nik;
    data['alamat'] = this.alamat;
    data['RT'] = this.rT;
    data['RW'] = this.rW;
    data['no_pengantar_surat'] = this.noPengantarSurat;
    data['tgl_surat_pengantar'] = this.tglSuratPengantar;
    data['alamat_domisili_kel_kepu'] = this.alamatDomisiliKelKepu;
    data['surat_digunakan_untuk'] = this.suratDigunakanUntuk;
    data['tgl_surat_dibuat'] = this.tglSuratDibuat;
    data['status_surat'] = this.statusSurat;
    data['images'] = this.images;
    data['id_akun'] = this.idAkun;
    return data;
  }
}
