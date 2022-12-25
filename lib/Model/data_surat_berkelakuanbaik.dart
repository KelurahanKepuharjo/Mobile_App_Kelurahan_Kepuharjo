class cBerkelakuanBaik {
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
  String statusSurat;
  String tglPengajuan;
  String rT;
  String rW;
  String suratDigunakanUntuk;
  String tglSuratDibuat;
  String images;
  String pdffile;
  String idAkun;

  cBerkelakuanBaik(
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
    this.statusSurat,
    this.tglPengajuan,
    this.rT,
    this.rW,
    this.suratDigunakanUntuk,
    this.tglSuratDibuat,
    this.images,
    this.pdffile,
    this.idAkun});

  cBerkelakuanBaik.fromJson(Map<String, dynamic> json) {
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
    statusSurat = json['status_surat'];
    tglPengajuan = json['tgl_pengajuan'];
    rT = json['RT'];
    rW = json['RW'];
    suratDigunakanUntuk = json['surat_digunakan_untuk'];
    tglSuratDibuat = json['tgl_surat_dibuat'];
    images = json['images'];
    pdffile = json['file_pdf'];
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
    data['status_surat'] = this.statusSurat;
    data['tgl_pengajuan'] = this.tglPengajuan;
    data['RT'] = this.rT;
    data['RW'] = this.rW;
    data['surat_digunakan_untuk'] = this.suratDigunakanUntuk;
    data['tgl_surat_dibuat'] = this.tglSuratDibuat;
    data['images'] = this.images;
    data['file_pdf'] = this.pdffile;
    data['id_akun'] = this.idAkun;
    return data;
  }
}