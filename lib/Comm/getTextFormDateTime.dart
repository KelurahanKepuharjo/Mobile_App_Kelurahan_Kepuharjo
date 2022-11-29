import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class getDateTime extends StatefulWidget {
  TextEditingController controller;

  bool isEnable;
  bool isreadOnly;

  getDateTime({
    required this.controller,
    this.isEnable = true,
    this.isreadOnly = true,
  });
  @override
  State<getDateTime> createState() => _getDateTimeState();
}

DateFormat? dateFormat;

class _getDateTimeState extends State<getDateTime> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('id');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          TextFormField(
            controller: widget.controller,
            readOnly: widget.isreadOnly,
            onSaved: (val) => TextEditingController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Tempat, Tanggal Lahir';
              }
              return null;
            },
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1800),
                  lastDate: DateTime(2100));
              if (pickedDate != null) {
                String formattedDate = dateFormat!.format(pickedDate);

                setState(() {
                  widget.controller.text = formattedDate.toString();
                });
              } else {
                print("Not Selected");
              }
            },
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.calendar_today),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: Color.fromARGB(179, 234, 234, 234),
              hintText: "Tanggal Lahir",
              hintStyle: GoogleFonts.poppins(fontSize: 12),
            ),
          ),
        ]));
  }
}
