import 'package:shared_preferences/shared_preferences.dart';

class RememberUser {
  storeUser(user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', user);
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString('user');
  }

  removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
  }
}
