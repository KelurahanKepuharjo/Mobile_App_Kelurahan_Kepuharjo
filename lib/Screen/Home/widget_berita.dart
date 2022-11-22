import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetBerita extends StatefulWidget {
  const WidgetBerita({key});

  @override
  State<WidgetBerita> createState() => _WidgetBeritaState();
}

GestureDetector getNews(
    BuildContext context, String title, int index, String subtitle) {
  return GestureDetector(
    onTap: () {
      if (index == 0) {
        //1.item
      }
      if (index == 1) {
        //2.item
      }
      if (index == 2) {
        //3.item
      }
      if (index == 3) {
        //4.item
      }
      if (index == 4) {
        //5.item
      }
    },
    child: Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: index == 0 || index == 2 || index == 4
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 239, 239, 239),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 239, 239, 239),
            ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: boldTextStyle.copyWith(
                fontSize: 20, color: blackColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.start,
            style: whiteTextStyle.copyWith(
                fontSize: 13, color: blackColor, fontWeight: FontWeight.normal),
          )
        ],
      ),
    ),
  );
}

class _WidgetBeritaState extends State<WidgetBerita> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 0, right: 10),
        child: Column(
          children: [
            getNews(context, "Berita", 0, "Yagatau gua"),
            getNews(context, "Berita", 1, "Kamu Nanyeak"),
            getNews(context, "Berita", 2, "Apaan tuh"),
            getNews(context, "Berita", 3, "Affah iyyah"),
            getNews(context, "Berita", 4, "Begini kids?"),
          ],
        ),
      ),
    );
  }
}
