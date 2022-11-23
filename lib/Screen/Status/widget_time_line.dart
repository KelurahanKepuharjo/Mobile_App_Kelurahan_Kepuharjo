import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Shared/custom_card.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetTimeLine extends StatefulWidget {
  final Color bgColor;
  final String title;
  final String subtitle;
  final String time;
  const WidgetTimeLine({
    Key key,
    this.bgColor,
    this.title,
    this.subtitle,
    this.time,
  }) : super(key: key);

  @override
  State<WidgetTimeLine> createState() => _WidgetTimeLineState();
}

class _WidgetTimeLineState extends State<WidgetTimeLine> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
            width: 10,
            child: Column(
              children: [
                CustomCard(
                  shadow: false,
                  height: 10,
                  width: 10,
                  bgColor: widget.bgColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                Expanded(
                    child: Container(
                  width: 1,
                  height: 50,
                  color: Color(0xFF7D7D7D),
                ))
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title,
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      Text(
                        widget.subtitle,
                        style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  )),
                  Text(
                    widget.time,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Color(0xFF2A2A72),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
