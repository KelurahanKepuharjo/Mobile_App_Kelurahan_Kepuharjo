import 'dart:convert';

import 'package:kepuharjo_app/Model/User_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberUser {
  storeUser(userInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', userInfo);
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
    await preferences.setString('currentUser', userJsonData);
  }

  static Future<User> readUser() async {
    User currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userInfo = preferences.getString('user');
    if (userInfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userInfo);
      currentUserInfo = User.fromJson(userDataMap);
    }
    return currentUserInfo;
  }

  static Future<void> removeUserSessions() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('user');
    await preferences.clear();
    await preferences.commit();
  }
}
