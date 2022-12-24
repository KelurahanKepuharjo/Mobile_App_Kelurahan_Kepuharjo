class cPindah {
  String idSurat;
  String tglDibuat;
  String noSurat;
  String sifat;
  String lampiran;
  String perihal;
  String nama;
  String tempatLahir;
  String tanggalLahir;
  String jenisKelamin;
  String status;
  String agama;
  String alamatAsal;
  String alamatTujuan;
  String kelurahan;
  String kecamatan;
  String kabupaten;
  String provinsi;
  String alamatPindah;
  String pengikut;
  String statusSurat;
  String tglPengajuan;
  String rT;
  String rW;
  String image;
  String pdffile;
  String idAkun;

  cPindah(
      {this.idSurat,
      this.tglDibuat,
      this.noSurat,
      this.sifat,
      this.lampiran,
      this.perihal,
      this.nama,
      this.tempatLahir,
      this.tanggalLahir,
      this.jenisKelamin,
      this.status,
      this.agama,
      this.alamatAsal,
      this.alamatTujuan,
      this.kelurahan,
      this.kecamatan,
      this.kabupaten,
      this.provinsi,
      this.alamatPindah,
      this.pengikut,
      this.statusSurat,
      this.tglPengajuan,
      this.rT,
      this.rW,
      this.image,
      this.pdffile,
      this.idAkun});

  cPindah.fromJson(Map<String, dynamic> json) {
    idSurat = json['id_surat'];
    tglDibuat = json['tgl_dibuat'];
    noSurat = json['no_surat'];
    sifat = json['sifat'];
    lampiran = json['lampiran'];
    perihal = json['perihal'];
    nama = json['nama'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    status = json['status'];
    agama = json['agama'];
    alamatAsal = json['alamat_asal'];
    alamatTujuan = json['alamat_tujuan'];
    kelurahan = json['kelurahan'];
    kecamatan = json['kecamatan'];
    kabupaten = json['kabupaten'];
    provinsi = json['provinsi'];
    alamatPindah = json['alamat_pindah'];
    pengikut = json['pengikut'];
    statusSurat = json['status_surat'];
    tglPengajuan = json['tgl_pengajuan'];
    rT = json['RT'];
    rW = json['RW'];
    image = json['image'];
    pdffile = json['file_pdf'];
    idAkun = json['id_akun'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_surat'] = this.idSurat;
    data['tgl_dibuat'] = this.tglDibuat;
    data['no_surat'] = this.noSurat;
    data['sifat'] = this.sifat;
    data['lampiran'] = this.lampiran;
    data['perihal'] = this.perihal;
    data['nama'] = this.nama;
    data['tempat_lahir'] = this.tempatLahir;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['status'] = this.status;
    data['agama'] = this.agama;
    data['alamat_asal'] = this.alamatAsal;
    data['alamat_tujuan'] = this.alamatTujuan;
    data['kelurahan'] = this.kelurahan;
    data['kecamatan'] = this.kecamatan;
    data['kabupaten'] = this.kabupaten;
    data['provinsi'] = this.provinsi;
    data['alamat_pindah'] = this.alamatPindah;
    data['pengikut'] = this.pengikut;
    data['status_surat'] = this.statusSurat;
    data['tgl_pengajuan'] = this.tglPengajuan;
    data['RT'] = this.rT;
    data['RW'] = this.rW;
    data['image'] = this.image;
    data['file_pdf'] = this.pdffile;
    data['id_akun'] = this.idAkun;
    return data;
  }
}
