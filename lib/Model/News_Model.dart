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

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id_berita'] = this.idBerita;
  //   data['judul'] = this.judul;
  //   data['sub_title'] = this.subTitle;
  //   data['dekripsi'] = this.dekripsi;
  //   return data;
  // }

}
