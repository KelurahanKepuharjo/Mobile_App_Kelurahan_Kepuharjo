import 'dart:io';
import 'dart:async';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Comm/getTextForm.dart';
import 'package:kepuharjo_app/Shared/shared.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class WidgetDataDetailProfil extends StatefulWidget {
  const WidgetDataDetailProfil({Key? key}) : super(key: key);

  @override
  State<WidgetDataDetailProfil> createState() => _WidgetDataDetailProfilState();
}

class _WidgetDataDetailProfilState extends State<WidgetDataDetailProfil> {
  DateFormat? dateFormat;
  File? image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('id');
  }

  Future getImageGalerry() async {
    final ImagePicker picker = ImagePicker();
    final File? imagePicked =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
    setState(() {});
  }

  Future getImageCamera() async {
    final ImagePicker picker = ImagePicker();
    final File? imagePicked =
        await ImagePicker.pickImage(source: ImageSource.camera);
    image = File(imagePicked!.path);
    setState(() {});
  }

  Future _modalBottomSheet() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: 200,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: greyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    onTap: () async {
                      await getImageGalerry();
                    },
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFF2A2A72).withOpacity(0.1),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: Color(0xFF2A2A72),
                      ),
                    ),
                    title: Text("Upload dari Galeri",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF454444),
                        )),
                    trailing: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey.shade200,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: blackColor,
                        size: 15,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      await getImageCamera();
                    },
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFF2A2A72).withOpacity(0.1),
                      ),
                      child: Icon(
                        Icons.image,
                        color: Color(0xFF2A2A72),
                      ),
                    ),
                    title: Text("Upload dari Kamera",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF454444),
                        )),
                    trailing: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey.shade200,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: blackColor,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
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
          Stack(
            children: [
              image == null
                  ? SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset("images/user.png")),
                    )
                  : SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(image!)),
                    ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFF2A2A72),
                    ),
                    child: InkWell(
                      onTap: () {
                        _modalBottomSheet();
                      },
                      child: Icon(
                        Icons.photo_camera,
                        color: whiteColor,
                        size: 20,
                      ),
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 20),
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
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1800),
                        lastDate: DateTime(2100));
                    if (pickedDate != null) {
                      String formattedDate = dateFormat!.format(pickedDate);

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
                  color: Color(0xFF2A2A72),
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
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
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
      animType: AnimType.SCALE,
      dialogType: DialogType.SUCCES,
      title: 'Berhasil!',
      titleTextStyle: GoogleFonts.poppins(
          fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF2A2A72)),
      desc: 'Data berhasil disimpan',
      descTextStyle: GoogleFonts.nunito(fontSize: 14, color: Colors.grey),
      btnOkOnPress: () {
        Navigator.pop(context);
      },
    ).show();
  }
}
