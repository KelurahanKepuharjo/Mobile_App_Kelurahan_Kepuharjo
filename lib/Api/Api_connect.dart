class ApiConnect {
  static const hostConnect = "http://192.168.31.87/Web_Kelurahan_kepuharjo";
  static const connectApi = "$hostConnect/Api";

  //login
  static const signin = "$connectApi/signin.php";
  //register
  static const signup = "$connectApi/signup.php";
  //read data berita
  static const berita = "$connectApi/read_berita.php";
  //postsurat keterangan tidak mampu
  static const sktm = "$connectApi/suket_tidakmampu.php";
  //postsurat keterangan Domisili
  static const domisili = "$connectApi/domisili.php";
  //postsurat keterangan akta
  static const akta = "$connectApi/suket_akta_kelahiran.php";
  //postsurat keterangan kematian
  static const kematian = "$connectApi/suket_kematian.php";
  //postsurat keterangan kematian
  static const pindah = "$connectApi/suket_pindah.php";
  //postsurat keterangan kematian
  static const belumNikah = "$connectApi/surat_ket_belum_menikah.php";
}
