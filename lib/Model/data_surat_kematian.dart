class cKematian {
  String idSurat;
  String noSurat;
  String namaAlmarhum;
  String saksiKematian;
  String hubungan;
  String hari;
  String tanggal;
  String alamat;
  String nikAlmarhum;
  String penyebabKematian;
  String suratDigunakan;
  String tanggalDibuat;
  String statusSurat;
  String tglPengajuan;
  String image;
  String idAkun;

  cKematian(
      {this.idSurat,
      this.noSurat,
      this.namaAlmarhum,
      this.saksiKematian,
      this.hubungan,
      this.hari,
      this.tanggal,
      this.alamat,
      this.nikAlmarhum,
      this.penyebabKematian,
      this.suratDigunakan,
      this.tanggalDibuat,
      this.statusSurat,
      this.tglPengajuan,
      this.image,
      this.idAkun});

  cKematian.fromJson(Map<String, dynamic> json) {
    idSurat = json['id_surat'];
    noSurat = json['no_surat'];
    namaAlmarhum = json['nama_almarhum'];
    saksiKematian = json['saksi_kematian'];
    hubungan = json['hubungan'];
    hari = json['hari'];
    tanggal = json['tanggal'];
    alamat = json['alamat'];
    nikAlmarhum = json['nik_almarhum'];
    penyebabKematian = json['penyebab_kematian'];
    suratDigunakan = json['surat_digunakan'];
    tanggalDibuat = json['tanggal_dibuat'];
    statusSurat = json['status_surat'];
    tglPengajuan = json['tgl_pengajuan'];
    image = json['image'];
    idAkun = json['id_akun'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_surat'] = this.idSurat;
    data['no_surat'] = this.noSurat;
    data['nama_almarhum'] = this.namaAlmarhum;
    data['saksi_kematian'] = this.saksiKematian;
    data['hubungan'] = this.hubungan;
    data['hari'] = this.hari;
    data['tanggal'] = this.tanggal;
    data['alamat'] = this.alamat;
    data['nik_almarhum'] = this.nikAlmarhum;
    data['penyebab_kematian'] = this.penyebabKematian;
    data['surat_digunakan'] = this.suratDigunakan;
    data['tanggal_dibuat'] = this.tanggalDibuat;
    data['status_surat'] = this.statusSurat;
    data['tgl_pengajuan'] = this.tglPengajuan;
    data['image'] = this.image;
    data['id_akun'] = this.idAkun;
    return data;
  }
}
