import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class getDateForm extends StatefulWidget {
  TextEditingController controller;

  bool isEnable;
  bool isreadOnly;

  getDateForm({
    this.controller,
    this.isEnable = true,
    this.isreadOnly = true,
  });
  @override
  State<getDateForm> createState() => _getDateFormState();
}

class _getDateFormState extends State<getDateForm> {
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
                return 'Please enter Tempat, Tanggal Kematian';
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
              filled: false,
              fillColor: const Color.fromARGB(179, 234, 234, 234),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: appColor),
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: "Tanggal Kematian",
              hintStyle: GoogleFonts.poppins(fontSize: 12),
            ),
          ),
        ]));
  }
}
