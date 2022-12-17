import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class getDateTime extends StatefulWidget {
  TextEditingController controller;

  bool isEnable;
  bool isreadOnly;

  getDateTime({
    this.controller,
    this.isEnable = true,
    this.isreadOnly = true,
  });
  @override
  State<getDateTime> createState() => _getDateTimeState();
}

class _getDateTimeState extends State<getDateTime> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          TextFormField(
            controller: widget.controller,
            readOnly: widget.isreadOnly,
            style: poppinsSmallBlack.copyWith(fontSize: 13),
            onSaved: (val) => TextEditingController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Tempat, Tanggal Lahir';
              }
              return null;
            },
            onTap: () async {
              DateTime pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1700),
                  lastDate: DateTime(2100));
              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('yyyy-M-dd').format(pickedDate);
                setState(() {
                  widget.controller.text = formattedDate.toString();
                });
              } else {
                print("Not Selected");
              }
            },
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.calendar_today),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(width: 1, color: appColor)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: appColor),
                borderRadius: BorderRadius.circular(15),
              ),
              filled: false,
              fillColor: Color.fromARGB(179, 234, 234, 234),
              hintText: "Tanggal Lahir",
              hintStyle: GoogleFonts.poppins(fontSize: 12),
            ),
          ),
        ]));
  }
}
