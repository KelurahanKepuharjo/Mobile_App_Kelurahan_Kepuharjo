import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/Domisili.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_akta_kelahiran.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_kematian.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/suket_pindah.dart';
import 'package:kepuharjo_app/Screen/PengajuanSurat/Surat/surat_ket_belum_menikah.dart';

class ApiConnect {
  static const hostConnect = "http://192.168.112.87/Web_Kelurahan_kepuharjo";
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
  static const Domisili = "$connectApi/Domisili.php";
  //postsurat keterangan akta
  static const Akta = "$connectApi/suket_akta_kelahiran.php";
  //postsurat keterangan kematian
  static const Kematian = "$connectApi/suket_kematian.php";
  //postsurat keterangan kematian
  static const Pindah = "$connectApi/suket_pindah.php";
  //postsurat keterangan kematian
  static const BelumNikah = "$connectApi/surat_ket_belum_menikah.php";
}