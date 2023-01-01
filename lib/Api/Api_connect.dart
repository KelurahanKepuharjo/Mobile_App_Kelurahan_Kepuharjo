class ApiConnect {
  // static const hostConnect = "http://suket-kel.wstif3a.id/";
  static const hostConnect = "http://192.168.0.117/Web_Kelurahan_Kepuharjo/";
  static const connectApi = "$hostConnect/Api";
  //view pdf surat
  static const viewpdf = "$connectApi/pdf/";

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
  //read sktm5
  static const readsktmSelesai = "$connectApi/read_sktm_selesai.php";
  //pembatalan sktm
  static const pembatalanSktm = "$connectApi/pembatalanSktm.php";

  //postsurat keterangan Domisili
  static const domisili = "$connectApi/domisili.php";
  //read domisili
  static const readdomisili = "$connectApi/read_surat_domisili.php";
  //read domisili selesai
  static const readdomisiliSelesai = "$connectApi/read_domisili_selesai.php";
  //pembatalan domisili
  static const pembatalanDomisili = "$connectApi/pembatalanDomisili.php";

  //postsurat keterangan akta
  static const akta = "$connectApi/suket_akta_kelahiran.php";
  //read akta
  static const readakta = "$connectApi/read_surat_akta_kelahiran.php";
  //read akta selesai
  static const readaktaSelesai = "$connectApi/read_akta_selesai.php";
  //pembatalan akta
  static const pembatalanAkta = "$connectApi/pembatalanAkta.php";

  //postsurat keterangan kematian
  static const kematian = "$connectApi/suket_kematian.php";
  //read kematian
  static const readkematian = "$connectApi/read_surat_kematian.php";
  //read kematian
  static const readkematianSelesai = "$connectApi/read_kematian_selesai.php";
  //pembatalan kematian
  static const pembatalanSuratKematian =
      "$connectApi/pembatalanSuratKematian.php";

  //postsurat keterangan pindah
  static const pindah = "$connectApi/suket_pindah.php";
  //read pindah
  static const readpindah = "$connectApi/read_surat_pindah.php";
  //read pindah
  static const readpindahSelesai = "$connectApi/read_pindah_selesai.php";
  //pembatalan pindah
  static const pembatalanPindah = "$connectApi/pembatalanPindah.php";

  //postsurat keterangan belum nikah
  static const belumNikah = "$connectApi/belumNikah.php";
  //read belum nikah
  static const readbelumNikah = "$connectApi/read_surat_belum_menikah.php";
  //read belum nikah
  static const readbelumNikahSelesai =
      "$connectApi/read_belumnikah_selesai.php";
  //pembatalan belum nikah
  static const pembatalanBelumNikah = "$connectApi/pembatalanBelumMenikah.php";

  //post surat keterangan usaha
  static const usaha = "$connectApi/usaha.php";
  //read usaha
  static const readUsaha = "$connectApi/read_surat_usaha.php";
  //read usaha
  static const readUsahaSelesai = "$connectApi/read_usaha_selesai.php";
  //pembatalan usaha
  static const pembatalanUsaha = "$connectApi/pembatalanUsaha.php";

  //post surat keterangan berkelakuan baik
  static const berkelakuanBaik = "$connectApi/berkelakuanBaik.php";
  //read berkelakuanBaik
  static const readberkelakuanBaik = "$connectApi/read_berkelakuan_baik.php";
  //read berkelakuanBaik
  static const readberkelakuanBaikSelesai =
      "$connectApi/read_berkelakuanbaik_selesai.php";
  //pembatalan berkelakuanBaik
  static const pembatalanBerkelakuanBaik =
      "$connectApi/pembatalanBerkelakuanBaik.php";
}
