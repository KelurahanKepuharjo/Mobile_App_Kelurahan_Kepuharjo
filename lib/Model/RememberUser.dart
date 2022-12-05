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

  static Future<void> storeInfoUser(User userInfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(userInfo.toJson());
    await preferences.setString("user", userJsonData);
  }

  static Future<User> readUser() async {
    User currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String user = preferences.getString("user");
    if (user != null) {
      Map<String, dynamic> userDataMap = jsonDecode(user);
      currentUserInfo = User.fromJson(userDataMap);
    }
    return currentUserInfo;
  }
}
