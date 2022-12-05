import 'dart:convert';

import 'package:kepuharjo_app/Model/User_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberUser {
  storeUser(user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', user);
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString('user');
  }

  removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    prefs.commit();
    prefs.remove('user');
  }
}
