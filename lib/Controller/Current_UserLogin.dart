import 'package:get/get.dart';
import 'package:kepuharjo_app/Controller/RememberUser.dart';
import 'package:kepuharjo_app/Model/User_Model.dart';

class CurrentUser {
  static final CurrentUser _instance = CurrentUser._internal();

  CurrentUser._internal();

  factory CurrentUser() => _instance;

  final Rx<User> _currentUser = User(
          idAkun: '',
          namaLengkap: '',
          password: '',
          hakAkses: '',
          noHp: '',
          rT: '',
          rW: '')
      .obs;

  User get user => _currentUser.value;

  getUserInfo() async {
    User getUserLocalStorage = await RememberUser.readUser();
    _currentUser.value = getUserLocalStorage;
  }
}


// class CurrentUser extends GetxController {
//   final Rx<User> _currentUser = User(
//           idAkun: '',
//           namaLengkap: '',
//           password: '',
//           hakAkses: '',
//           noHp: '',
//           rT: '',
//           rW: '')
//       .obs;

//   User get user => _currentUser.value;

//   getUserInfo() async {
//     User getUserLocalStorage = await RememberUser.readUser();
//     _currentUser.value = getUserLocalStorage;
//   }
// }
