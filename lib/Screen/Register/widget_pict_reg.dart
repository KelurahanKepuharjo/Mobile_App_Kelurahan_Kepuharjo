import 'package:flutter/material.dart';

class WidgetPictureReg extends StatefulWidget {
  const WidgetPictureReg({key});

  @override
  State<WidgetPictureReg> createState() => _WidgetPictureRegState();
}

class _WidgetPictureRegState extends State<WidgetPictureReg> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          ClipRRect(
            child: Image.asset(
              'images/splashlogo.png',
              height: 170,
            ),
          )
        ],
      ),
    );
  }
}
