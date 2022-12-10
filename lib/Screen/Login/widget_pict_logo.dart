import 'package:flutter/material.dart';

class WidgetPicture extends StatefulWidget {
  const WidgetPicture({Key key}) : super(key: key);

  @override
  State<WidgetPicture> createState() => _WidgetPictureState();
}

class _WidgetPictureState extends State<WidgetPicture> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            child: Image.asset(
              'images/logo.png',
              height: 250,
              alignment: Alignment.center,
            ),
          )
        ],
      ),
    );
  }
}
