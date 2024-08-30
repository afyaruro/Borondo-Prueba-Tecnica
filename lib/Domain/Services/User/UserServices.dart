import 'package:flutter/material.dart';
import 'package:prueba_tecnica/Domain/Services/User/CreateUserServices.dart';
import 'package:prueba_tecnica/Domain/Services/User/LoginUserServices.dart';
import 'package:prueba_tecnica/Infrastructure/Repository/User/UserRepository.dart';

class UserServices {
  final UserRepository _userRepository = UserRepository();

  Future<void> createUser(
      {required String name,
      required var image,
      required String email,
      required String nationality,
      required String phone,
      required String password,
      required String birday,
      required BuildContext context}) async {

    CreateUserServices.createUser(
        name: name,
        image: image,
        email: email,
        nationality: nationality,
        phone: phone,
        password: password,
        birday: birday,
        context: context,
        userRepository: _userRepository);

  }

  Future<void> LoginUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    LoginUserServices.LoginUser(
        email: email,
        password: password,
        context: context,
        userRepository: _userRepository);
  }
}
