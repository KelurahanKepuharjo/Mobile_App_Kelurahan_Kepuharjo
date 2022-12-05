import 'package:get/get.dart';
import 'package:kepuharjo_app/Controller/login_services.dart';
import 'package:kepuharjo_app/Model/RememberUser.dart';
import 'package:kepuharjo_app/Model/User_Model.dart';

class CurrentUser extends GetxController {
  Rx<User> _currentUser =
      User(idAkun: '', namaLengkap: '', password: '', noHp: '').obs;

  User get user => _currentUser.value;

  getUserInfo() async {
    User getUserLocalStorage = await RememberUser.readUser();
    _currentUser.value = getUserLocalStorage;
  }
}

class Saveinfo {
  User _curUser = User(idAkun: '', namaLengkap: '', password: '', noHp: '');
  User get users => _curUser;
  getUserLogin() async {
    User getUserLocalStorage = await RememberUser.readUser();
    _curUser = getUserLocalStorage;
  }
}
