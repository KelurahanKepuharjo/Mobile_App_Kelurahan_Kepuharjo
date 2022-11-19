import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Screen/Status/widget_time_line.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetTimelineWrapper extends StatefulWidget {
  const WidgetTimelineWrapper({Key key}) : super(key: key);

  @override
  State<WidgetTimelineWrapper> createState() => _WidgetTimelineWrapperState();
}

class _WidgetTimelineWrapperState extends State<WidgetTimelineWrapper> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          WidgetTimeLine(
            bgColor: greenColor,
            title: "Sedang dalam Antrian",
            subtitle: "Surat telah diajukan",
            time: "27 april 2022",
          ),
          const WidgetTimeLine(
            bgColor: Color(0xFF7D7D7D),
            title: "Sedang dalam Proses",
            subtitle: "Surat sedang dalam proses pembuatan ",
            time: "28 april 2022",
          ),
          const WidgetTimeLine(
            bgColor: Color(0xFF7D7D7D),
            title: "Selesai",
            subtitle: "Surat dapat diambil",
            time: "29 april 2022",
          ),
        ],
      ),
    );
  }
}
