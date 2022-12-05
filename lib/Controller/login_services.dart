// import 'package:kepuharjo_app/Api/Api_connect.dart';
// import 'package:kepuharjo_app/Controller/login_controller.dart';
// import 'package:http/http.dart' as http;
// import 'package:kepuharjo_app/Model/RememberUser.dart';
// import '../Model/User_Model.dart';

// class LoginServices extends ILogin {
//   @override
//   Future<User?> getUser() async {
//     var user = RememberUser().getUser();
//     if (user != null) {
//       return User();
//     } else {
//       return null;
//     }
//   }

//   @override
//   Future<bool> logout() async {
//     var user = RememberUser().removeUser();
//     if (user != null) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
import 'dart:convert';

import 'package:kepuharjo_app/Model/User_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberUserPrefs {
  static Future<void> storeUserInfo(User userInfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(userInfo.toJson());
    await preferences.setString("currentUser", userJsonData);
  }

  static Future<User> readUser() async {
    User currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userInfo = preferences.getString("currentUser");
    if (userInfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userInfo);
      currentUserInfo = User.fromJson(userDataMap);
    }
    return currentUserInfo;
  }
}
