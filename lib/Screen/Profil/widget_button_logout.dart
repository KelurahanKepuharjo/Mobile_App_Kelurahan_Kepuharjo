import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Screen/Login/appearance_login.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetButtonLogOut extends StatefulWidget {
  const WidgetButtonLogOut({Key key}) : super(key: key);

  @override
  State<WidgetButtonLogOut> createState() => _WidgetButtonLogOutState();
}

class _WidgetButtonLogOutState extends State<WidgetButtonLogOut> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 45,
          width: 300,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF2BAE82),
                Color.fromARGB(255, 81, 195, 159),
              ],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => AppeareaceLogin()),
                    (Route<dynamic> route) => false);
              },
              child: Text(
                'Log Out',
                style:
                    boldTextStyle.copyWith(fontSize: 18, color: Colors.white),
              )),
        ),
      ],
    );
  }
}
