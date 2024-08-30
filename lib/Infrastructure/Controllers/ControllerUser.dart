import 'package:get/get.dart';
import 'package:prueba_tecnica/Domain/Models/User.dart';

class ControllerUser extends GetxController {
  final Rxn<User> _user = Rxn<User>();
  User? get user => _user.value;

  Future<void> DataUser(User user) async {
    _user.value = user;
  }
}
