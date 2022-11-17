import 'package:flutter/material.dart';

class WidgetPicture extends StatefulWidget {
  const WidgetPicture({key});

  @override
  State<WidgetPicture> createState() => _WidgetPictureState();
}

class _WidgetPictureState extends State<WidgetPicture> {
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
