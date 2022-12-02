import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  late TextEditingController nikController,
      namaController,
      passController,
      tlpController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nikController = TextEditingController();
    namaController = TextEditingController();
    passController = TextEditingController();
    tlpController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nikController.dispose();
    namaController.dispose();
    passController.dispose();
    tlpController.dispose();
  }

  checkSignup() {
    if (nikController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nik harus diisi");
    } else if (namaController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nama Lengkap harus diisi");
    } else if (passController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Password harus diisi");
    } else if (tlpController.text.isEmpty) {
      Fluttertoast.showToast(msg: "No.Telepon harus diisi");
    } else {
      register();
    }
  }

  register() async {
    var response = await http.post(Uri.parse(ApiConnect.signup), body: {
      "id_akun": nikController.text,
      "nama_lengkap": namaController.text,
      "password": passController.text,
      "no_hp": tlpController.text,
    });
    var data = json.decode(response.body);
    try {
      if (response.statusCode == 200) {
        if (data == "Error") {
          Fluttertoast.showToast(
              toastLength: Toast.LENGTH_LONG,
              fontSize: 14,
              gravity: ToastGravity.SNACKBAR,
              msg: "Registrasi akun anda gagal",
              backgroundColor: Colors.grey.shade300,
              textColor: Colors.black);
        } else {
          Fluttertoast.showToast(
              toastLength: Toast.LENGTH_LONG,
              fontSize: 14,
              gravity: ToastGravity.SNACKBAR,
              msg: "Selamat, registrasi akun anda berhasil",
              backgroundColor: Colors.grey.shade300,
              textColor: Colors.black);
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  snackBarFailed(context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        content: AwesomeSnackbarContent(
            title: "Gagal",
            message: "Nik sudah digunakan, Silahkan menggunakan Nik yang lain",
            contentType: ContentType.failure)));
  }

  snackBarSucces(context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        content: AwesomeSnackbarContent(
            title: "Berhasil",
            message: "Selamat, Registrasi Akun Berhasil",
            contentType: ContentType.success)));
  }
}
