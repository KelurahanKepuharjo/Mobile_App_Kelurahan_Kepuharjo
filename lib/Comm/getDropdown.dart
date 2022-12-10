import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String _value;
  List jk = ["Laki Laki", "Perempuan"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(179, 234, 234, 234),
      ),
      child: DropdownButton(
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        },
        underline: SizedBox(),
        value: _value,
        style: poppinsMediumBlack,
        iconSize: 25,
        isExpanded: true,
        borderRadius: BorderRadius.circular(20),
        elevation: 0,
        icon: Icon(Icons.keyboard_arrow_down),
        hint: Text("Pilih Jenis Kelamin",
            style: poppinsSmallBlack.copyWith(
                color: Color.fromARGB(155, 0, 0, 0))),
        dropdownColor: Colors.white,
        items: jk.map((e) {
          return DropdownMenuItem(value: e, child: Text(e));
        }).toList(),
      ),
    );
  }
}
