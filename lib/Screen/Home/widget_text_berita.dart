import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetTextBerita extends StatefulWidget {
  const WidgetTextBerita({Key key}) : super(key: key);

  @override
  State<WidgetTextBerita> createState() => _WidgetTextBeritaState();
}

class _WidgetTextBeritaState extends State<WidgetTextBerita> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              "Berita Terkini",
              style: poppinsMediumBlack.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
