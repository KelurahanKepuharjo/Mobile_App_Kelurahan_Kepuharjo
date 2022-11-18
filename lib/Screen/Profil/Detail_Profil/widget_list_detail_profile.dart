import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Comm/getTextForm.dart';
import 'package:kepuharjo_app/Shared/shared.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class WidgetDataDetailProfil extends StatefulWidget {
  const WidgetDataDetailProfil({Key key}) : super(key: key);

  @override
  State<WidgetDataDetailProfil> createState() => _WidgetDataDetailProfilState();
}

class _WidgetDataDetailProfilState extends State<WidgetDataDetailProfil> {
  DateFormat dateFormat;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('id');
  }

  final nik = TextEditingController();
  final nama = TextEditingController();
  final nokk = TextEditingController();
  final tlp = TextEditingController();
  final ttl = TextEditingController();
  final kwn = TextEditingController();
  final agm = TextEditingController();
  final jk = TextEditingController();
  final profesi = TextEditingController();
  final statuskawin = TextEditingController();
  final alamat = TextEditingController();
  final rt = TextEditingController();
  final rw = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          getTextForm(
            controller: nik,
            hintName: "Nama Lengkap",
            keyboardType: TextInputType.number,
            inputFormatters: FilteringTextInputFormatter.digitsOnly,
          ),
          const SizedBox(height: 5),
          getTextForm(
            controller: nokk,
            hintName: "No Kartu Keluarga",
            keyboardType: TextInputType.number,
            inputFormatters: FilteringTextInputFormatter.digitsOnly,
          ),
          const SizedBox(height: 5),
          getTextForm(
            controller: nama,
            hintName: "No.Nik",
            keyboardType: TextInputType.name,
            inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
          ),
          const SizedBox(height: 5),
          getTextForm(
            controller: tlp,
            hintName: "No.Telepon",
            keyboardType: TextInputType.number,
            inputFormatters: FilteringTextInputFormatter.digitsOnly,
          ),
          const SizedBox(height: 5),
          SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                TextFormField(
                  controller: ttl,
                  readOnly: true,
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
                        firstDate: DateTime(1800),
                        lastDate: DateTime(2100));
                    if (pickedDate != null) {
                      String formattedDate = dateFormat.format(pickedDate);

                      setState(() {
                        ttl.text = formattedDate.toString();
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
                    hintText: "Tempat,Tanggal Lahir",
                    hintStyle: GoogleFonts.poppins(fontSize: 12),
                  ),
                ),
              ])),
          const SizedBox(height: 5),
          getTextForm(
            controller: kwn,
            hintName: "Kewarganegaraan",
            keyboardType: TextInputType.name,
            inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
          ),
          const SizedBox(height: 5),
          getTextForm(
            controller: agm,
            hintName: "Agama",
            keyboardType: TextInputType.name,
            inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
          ),
          const SizedBox(height: 5),
          getTextForm(
            controller: jk,
            hintName: "Jenis Kelamin",
            keyboardType: TextInputType.name,
            inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
          ),
          const SizedBox(height: 5),
          getTextForm(
            controller: profesi,
            hintName: "Pekerjaan",
            keyboardType: TextInputType.name,
            inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
          ),
          const SizedBox(height: 5),
          getTextForm(
            controller: statuskawin,
            hintName: "Status Perkawinan",
            keyboardType: TextInputType.name,
            inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
          ),
          const SizedBox(height: 5),
          getTextForm(
            controller: alamat,
            hintName: "Alamat",
            keyboardType: TextInputType.name,
            inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: 60,
                  width: 125,
                  child: Column(children: [
                    TextFormField(
                      controller: rt,
                      keyboardType: TextInputType.number,
                      onSaved: (val) => val as TextEditingController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silahakan isi data berikut';
                        }
                        return null;
                      },
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Color.fromARGB(179, 234, 234, 234),
                          hintText: "Rt",
                          hintStyle: GoogleFonts.poppins(fontSize: 12)),
                    ),
                  ])),
              SizedBox(
                  height: 60,
                  width: 125,
                  child: Column(children: [
                    TextFormField(
                      controller: rw,
                      keyboardType: TextInputType.number,
                      onSaved: (val) => val as TextEditingController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silahakan isi data berikut';
                        }
                        return null;
                      },
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Color.fromARGB(179, 234, 234, 234),
                          hintText: "Rw",
                          hintStyle: GoogleFonts.poppins(fontSize: 12)),
                    ),
                  ])),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color.fromARGB(179, 234, 234, 234),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF595959),
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_circle_up_outlined,
                          color: whiteColor,
                          size: 20,
                        ),
                        label: Text(
                          'Unggah Foto KK',
                          style: whiteTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color.fromARGB(179, 234, 234, 234),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF595959),
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_circle_up_outlined,
                          color: whiteColor,
                          size: 20,
                        ),
                        label: Text(
                          'Unggah Foto KTP',
                          style: whiteTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 45,
                width: 250,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xFF239496), Color(0xFF2BE8D1)]),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        )),
                    onPressed: showSuccessDialog,
                    child: Text(
                      'Simpan',
                      style: whiteTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  showSuccessDialog() {
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.success,
      title: 'Berhasil!',
      titleTextStyle: GoogleFonts.poppins(
          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
      desc: 'Data berhasil disimpan',
      descTextStyle: GoogleFonts.nunito(fontSize: 14, color: Colors.grey),
      btnOkOnPress: () {
        Navigator.pop(context);
      },
    ).show();
  }
}
