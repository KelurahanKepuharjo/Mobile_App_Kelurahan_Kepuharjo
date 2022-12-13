class cAkta {
  String idSurat;
  String nomorSurat;
  String namaAnak;
  String tempatLahir;
  String tanggalLahir;
  String jenisKelamin;
  String agama;
  String status;
  String pekerjaan;
  String nik;
  String alamat;
  String namaAyah;
  String umurAyah;
  String kebangsaanAyah;
  String agamaAyah;
  String pekerjaanAyah;
  String alamatAyah;
  String namaIbu;
  String umurIbu;
  String kebangsaanIbu;
  String agamaIbu;
  String pekerjaanIbu;
  String alamatIbu;
  String statusSurat;
  String tglPengajuan;
  String image;
  String idAkun;

  cAkta(
      {this.idSurat,
      this.nomorSurat,
      this.namaAnak,
      this.tempatLahir,
      this.tanggalLahir,
      this.jenisKelamin,
      this.agama,
      this.status,
      this.pekerjaan,
      this.nik,
      this.alamat,
      this.namaAyah,
      this.umurAyah,
      this.kebangsaanAyah,
      this.agamaAyah,
      this.pekerjaanAyah,
      this.alamatAyah,
      this.namaIbu,
      this.umurIbu,
      this.kebangsaanIbu,
      this.agamaIbu,
      this.pekerjaanIbu,
      this.alamatIbu,
      this.statusSurat,
      this.tglPengajuan,
      this.image,
      this.idAkun});

  cAkta.fromJson(Map<String, dynamic> json) {
    idSurat = json['id_surat'];
    nomorSurat = json['nomor_surat'];
    namaAnak = json['nama_anak'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    agama = json['agama'];
    status = json['status'];
    pekerjaan = json['pekerjaan'];
    nik = json['nik'];
    alamat = json['alamat'];
    namaAyah = json['nama_ayah'];
    umurAyah = json['umur_ayah'];
    kebangsaanAyah = json['kebangsaan_ayah'];
    agamaAyah = json['agama_ayah'];
    pekerjaanAyah = json['pekerjaan_ayah'];
    alamatAyah = json['alamat_ayah'];
    namaIbu = json['nama_ibu'];
    umurIbu = json['umur_ibu'];
    kebangsaanIbu = json['kebangsaan_ibu'];
    agamaIbu = json['agama_ibu'];
    pekerjaanIbu = json['pekerjaan_ibu'];
    alamatIbu = json['alamat_ibu'];
    statusSurat = json['status_surat'];
    tglPengajuan = json['tgl_pengajuan'];
    image = json['image'];
    idAkun = json['id_akun'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_surat'] = this.idSurat;
    data['nomor_surat'] = this.nomorSurat;
    data['nama_anak'] = this.namaAnak;
    data['tempat_lahir'] = this.tempatLahir;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['agama'] = this.agama;
    data['status'] = this.status;
    data['pekerjaan'] = this.pekerjaan;
    data['nik'] = this.nik;
    data['alamat'] = this.alamat;
    data['nama_ayah'] = this.namaAyah;
    data['umur_ayah'] = this.umurAyah;
    data['kebangsaan_ayah'] = this.kebangsaanAyah;
    data['agama_ayah'] = this.agamaAyah;
    data['pekerjaan_ayah'] = this.pekerjaanAyah;
    data['alamat_ayah'] = this.alamatAyah;
    data['nama_ibu'] = this.namaIbu;
    data['umur_ibu'] = this.umurIbu;
    data['kebangsaan_ibu'] = this.kebangsaanIbu;
    data['agama_ibu'] = this.agamaIbu;
    data['pekerjaan_ibu'] = this.pekerjaanIbu;
    data['alamat_ibu'] = this.alamatIbu;
    data['status_surat'] = this.statusSurat;
    data['tgl_pengajuan'] = this.tglPengajuan;
    data['image'] = this.image;
    data['id_akun'] = this.idAkun;
    return data;
  }
}
