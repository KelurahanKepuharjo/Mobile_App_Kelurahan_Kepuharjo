class ApiConnect {
  static const hostConnect = "http://192.168.117.87/Web_Kelurahan_Kepuharjo";
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
  //postsurat keterangan kematian
  static const pindah = "$connectApi/suket_pindah.php";
  //postsurat keterangan kematian
  static const belumNikah = "$connectApi/surat_ket_belum_menikah.php";
}
