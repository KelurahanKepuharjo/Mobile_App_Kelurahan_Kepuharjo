import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Comm/ExpandedListAnimationWidget.dart';
import 'package:kepuharjo_app/Comm/Scrollbar.dart';
import 'package:kepuharjo_app/Comm/getTextField.dart';
import 'package:kepuharjo_app/Comm/getTextForm.dart';
import 'package:kepuharjo_app/Screen/Home.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class Pengajuannich extends StatefulWidget {
  const Pengajuannich({Key key}) : super(key: key);

  @override
  _Pengajuannich createState() => _Pengajuannich();
}

List<String> _list = [
  'Achmad Fawaid',
  "Edy Atthoillah",
  "Faisal Oktabrian",
  'Nadia Ayu',
  'Kurrota Akyun'
];

class _Pengajuannich extends State<Pengajuannich> {
  DateFormat dateFormat;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('id');
  }

  bool isStrechedDropDown = false;
  int groupValue;
  String title = 'Select Person';
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
  GestureDetector getLetter(String title, int index) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          //1.item
        }
        if (index == 1) {
          //2.item
        }
        if (index == 2) {
          //3.item
        }
        if (index == 3) {
          //4.item
        }
        if (index == 4) {
          //5.item
        }
        if (index == 5) {
          //5.item
        }
        if (index == 6) {
          //5.item
        }
        if (index == 7) {
          //5.item
        }
        if (index == 8) {
          //5.item
        }
        if (index == 9) {
          //5.item
        }
        if (index == 10) {
          //5.item
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        decoration:
            index == 0 || index == 3 || index == 4 || index == 7 || index == 8
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF2BAE82),
                        Color.fromARGB(255, 81, 195, 159),
                      ],
                    ),
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF2BAE82),
                        Color.fromARGB(255, 81, 195, 159),
                      ],
                    ),
                  ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/email3.png",
                height: 50,
                width: 50,
                alignment: Alignment.topCenter,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: whiteColor,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Icon(Icons.keyboard_arrow_left),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          '  Pengajuan Surat',
          style: whiteTextStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    lightGreen,
                    midGreen,
                  ],
                ))),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
                      borderRadius: BorderRadius.all(Radius.circular(27))),
                  child: Column(
                    children: [
                      Container(
                          // height: 45,
                          width: double.infinity,
                          padding: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25))),
                          constraints: const BoxConstraints(
                            minHeight: 45,
                            minWidth: double.infinity,
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Text(
                                    title,
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isStrechedDropDown = !isStrechedDropDown;
                                    });
                                  },
                                  child: Icon(isStrechedDropDown
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down)),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    showAddPerson(context);
                                  },
                                  child: const Icon(Icons.person_add)),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          )),
                      ExpandedSection(
                        expand: isStrechedDropDown,
                        height: 100,
                        child: MyScrollbar(
                          builder: (context, scrollController2) =>
                              ListView.builder(
                                  padding: EdgeInsets.all(0),
                                  controller: scrollController2,
                                  shrinkWrap: true,
                                  itemCount: _list.length,
                                  itemBuilder: (context, index) {
                                    return RadioListTile(
                                        title: Text(_list.elementAt(index)),
                                        value: index,
                                        groupValue: groupValue,
                                        onChanged: (val) {
                                          setState(() {
                                            groupValue = val;
                                            title = _list.elementAt(index);
                                          });
                                        });
                                  }),
                        ),
                      )
                    ],
                  ),
                )),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Daftar Nama Surat : ",
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: blackColor,
              height: 10,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  getLetter("Surat Keterangan Tidak Mampu", 0),
                  getLetter("Surat Keterangan Belum Menikah", 1),
                  getLetter("Surat Keterangan Bepergian", 2),
                  getLetter("Surat Keterangan Berkelakuan Baik (SKCK)", 3),
                  getLetter("Surat Keterangan Domisili", 4),
                  getLetter("Surat Keterangan Identitas", 5),
                  getLetter("Surat Keterangan Kematian", 6),
                  getLetter("Surat Keterangan Kenal Lahir", 7),
                  getLetter("Surat Keterangan Keramaian", 8),
                  getLetter("Surat Keterangan Pindah", 9),
                  getLetter("Surat Keterangan Usaha", 10),
                ],
              ),
            ),
          ],
        ),
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

  Future<void> showAddPerson(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: whiteColor,
            insetPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            title: Text(
              "Silahkan lengkapi data berikut : ",
              style: blackTextStyle.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),
            content: Container(
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: ListView(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      getTextForm(
                        controller: nik,
                        hintName: "No.NIK",
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
                        hintName: "Nama Lengkap",
                        keyboardType: TextInputType.name,
                        inputFormatters:
                            FilteringTextInputFormatter.singleLineFormatter,
                      ),
                      const SizedBox(height: 5),
                      getTextForm(
                        controller: tlp,
                        hintName: "No.Telepon",
                        keyboardType: TextInputType.number,
                        inputFormatters: FilteringTextInputFormatter.digitsOnly,
                      ),
                      const SizedBox(height: 5),
                      Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
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
                                      String formattedDate =
                                          dateFormat.format(pickedDate);

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
                                    fillColor:
                                        Color.fromARGB(179, 234, 234, 234),
                                    hintText: "Tempat,Tanggal Lahir",
                                    hintStyle:
                                        GoogleFonts.poppins(fontSize: 12),
                                  ),
                                ),
                              ])),
                      const SizedBox(height: 5),
                      getTextForm(
                        controller: kwn,
                        hintName: "Kewarganegaraan",
                        keyboardType: TextInputType.name,
                        inputFormatters:
                            FilteringTextInputFormatter.singleLineFormatter,
                      ),
                      const SizedBox(height: 5),
                      getTextForm(
                        controller: agm,
                        hintName: "Agama",
                        keyboardType: TextInputType.name,
                        inputFormatters:
                            FilteringTextInputFormatter.singleLineFormatter,
                      ),
                      const SizedBox(height: 5),
                      getTextForm(
                        controller: jk,
                        hintName: "Jenis Kelamin",
                        keyboardType: TextInputType.name,
                        inputFormatters:
                            FilteringTextInputFormatter.singleLineFormatter,
                      ),
                      const SizedBox(height: 5),
                      getTextForm(
                        controller: profesi,
                        hintName: "Pekerjaan",
                        keyboardType: TextInputType.name,
                        inputFormatters:
                            FilteringTextInputFormatter.singleLineFormatter,
                      ),
                      const SizedBox(height: 5),
                      getTextForm(
                        controller: statuskawin,
                        hintName: "Status Perkawinan",
                        keyboardType: TextInputType.name,
                        inputFormatters:
                            FilteringTextInputFormatter.singleLineFormatter,
                      ),
                      const SizedBox(height: 5),
                      getTextForm(
                        controller: alamat,
                        hintName: "Alamat",
                        keyboardType: TextInputType.name,
                        inputFormatters:
                            FilteringTextInputFormatter.singleLineFormatter,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 60,
                              width: 125,
                              child: Column(children: [
                                TextFormField(
                                  controller: rt,
                                  keyboardType: TextInputType.number,
                                  onSaved: (val) =>
                                      val as TextEditingController,
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide.none),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(179, 234, 234, 234),
                                      hintText: "Rt",
                                      hintStyle:
                                          GoogleFonts.poppins(fontSize: 12)),
                                ),
                              ])),
                          Container(
                              height: 60,
                              width: 125,
                              child: Column(children: [
                                TextFormField(
                                  controller: rw,
                                  keyboardType: TextInputType.number,
                                  onSaved: (val) =>
                                      val as TextEditingController,
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide.none),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(179, 234, 234, 234),
                                      hintText: "Rw",
                                      hintStyle:
                                          GoogleFonts.poppins(fontSize: 12)),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                      )
                    ],
                  ),
                ],
              ),
            ),
            actions: [
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
              const SizedBox(
                height: 20,
              )
            ],
          );
        });
  }
}
