import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kepuharjo_app/Api/Api_connect.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  late TextEditingController nikController, passController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nikController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nikController.dispose();
    passController.dispose();
  }

  checkSignin() {
    if (nikController.text.isEmpty || passController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Nik dan password harus diisi");
    } else {
      login();
    }
  }

  login() async {
    var response = await http.post(Uri.parse(ApiConnect.signin), body: {
      "id_akun": nikController.text,
      "password": passController.text,
    });
    var data = json.decode(response.body);
    try {
      if (response.statusCode == 200) {
        if (data["Berhasil Login"]) {
          Fluttertoast.showToast(
              toastLength: Toast.LENGTH_LONG,
              fontSize: 14,
              gravity: ToastGravity.SNACKBAR,
              msg: "Selamat, Anda berhasil login",
              backgroundColor: Colors.grey.shade300,
              textColor: Colors.black);
        } else {
          Fluttertoast.showToast(
              toastLength: Toast.LENGTH_LONG,
              fontSize: 14,
              gravity: ToastGravity.SNACKBAR,
              msg: "Nik dan password salah",
              backgroundColor: Colors.grey.shade300,
              textColor: Colors.black);
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
