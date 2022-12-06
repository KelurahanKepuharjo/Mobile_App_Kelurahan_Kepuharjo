class cNews {
  String idBerita;
  String judul;
  String subTitle;
  String dekripsi;

  cNews({
    this.idBerita,
    this.judul,
    this.subTitle,
    this.dekripsi,
  });

  factory cNews.fromJson(Map<String, dynamic> json) {
    return cNews(
        idBerita: json['id_berita'],
        judul: json['judul'],
        subTitle: json['sub_title'],
        dekripsi: json['deskripsi']);
  }
}
