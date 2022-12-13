class ApiConnect {
  static const hostConnect = "http://192.168.13.87/Web_Kelurahan_Kepuharjo";
  static const connectApi = "$hostConnect/Api";

  //login
  static const signin = "$connectApi/signin.php";
  //register
  static const signup = "$connectApi/signup.php";
  //read data berita
  static const berita = "$connectApi/read_berita.php";
  //postsurat keterangan tidak mampu
  static const sktm = "$connectApi/surat_tidak_mampu.php";
  //read sktm
  static const readsktm = "$connectApi/read_surat_tidak_mampu.php";
  //postsurat keterangan Domisili
  static const domisili = "$connectApi/domisili.php";
  //read domisili
  static const readdomisili = "$connectApi/read_surat_domisili.php";
  //postsurat keterangan akta
  static const akta = "$connectApi/suket_akta_kelahiran.php";
  //postsurat keterangan kematian
  static const kematian = "$connectApi/suket_kematian.php";
  //read kematian
  static const readkematian = "$connectApi/read_surat_kematian.php";
  //postsurat keterangan pindah
  static const pindah = "$connectApi/suket_pindah.php";
  //read pindah
  static const readpindah = "$connectApi/read_surat_pindah.php";
  //postsurat keterangan belum nikah
  static const belumNikah = "$connectApi/surat_ket_belum_menikah.php";
  //read belum nikah
  static const readbelumNikah = "$connectApi/read_surat_belum_menikah.php";
  //post surat keterangan usaha
  static const usaha = "$connectApi/usaha.php";
  //read usaha
  static const readUsaha = "$connectApi/read_surat_usaha.php";
}
