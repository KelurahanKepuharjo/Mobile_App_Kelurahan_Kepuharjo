class ApiConnect {
  static const hostConnect = "http:// 192.168.0.117/Web_Kelurahan_kepuharjo";
  static const connectApi = "$hostConnect/Api";

  //login
  static const signin = "$connectApi/signin.php";
  //register
  static const signup = "$connectApi/signup.php";
  //read data berita
  static const berita = "$connectApi/read_berita.php";
  //postsurat keterangan tidak mampu
  static const sktm = "$connectApi/suket_tidakmampu.php";
}
