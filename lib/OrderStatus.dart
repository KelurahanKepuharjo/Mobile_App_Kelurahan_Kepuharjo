import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Controller/Current_UserLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderStatus with ChangeNotifier {
  bool _isOrderInProgress = false;
  String _currentApplicationType;
  String _userId;

  bool get isOrderInProgress => _isOrderInProgress;
  String get currentApplicationType => _currentApplicationType;

  void setUserId(String userId) {
    _userId = userId;
  }

  void setInProgress(bool inProgress, [String applicationType]) async {
    _isOrderInProgress = inProgress;
    _currentApplicationType = applicationType;
    notifyListeners();

    // Mendapatkan instance dari shared preferences
    final prefs = await SharedPreferences.getInstance();

    // Mengambil id akun pengguna yang sedang login
    final currentUser = CurrentUser();
    final userId = currentUser.user.idAkun;

    // Menyimpan data ke shared preferences dengan key yang unik berdasarkan id pengguna
    prefs.setBool('$userId.isOrderInProgress', inProgress);
    prefs.setString('$userId.currentApplicationType', applicationType);
  }

  Future<void> loadData() async {
    // Mendapatkan instance dari shared preferences
    final prefs = await SharedPreferences.getInstance();

    // Mengambil id akun pengguna yang sedang login
    final currentUser = CurrentUser();
    final userId = currentUser.user.idAkun;

    // Mengambil data dari shared preferences dengan key yang sesuai dengan id pengguna yang login saat ini
    _isOrderInProgress = prefs.getBool('$userId.isOrderInProgress');
    _currentApplicationType = prefs.getString('$userId.currentApplicationType');

    notifyListeners();
  }
}
