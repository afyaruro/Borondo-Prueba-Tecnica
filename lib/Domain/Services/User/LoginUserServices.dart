import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica/Domain/Alerts/ShowCustomSnackbar.dart';
import 'package:prueba_tecnica/Domain/Alerts/showLoadingDialog.dart';
import 'package:prueba_tecnica/Infrastructure/Controllers/ControllerUser.dart';
import 'package:prueba_tecnica/Infrastructure/Repository/User/UserRepository.dart';

class LoginUserServices {

  static Future<void> LoginUser(
      {required String email,
      required String password,
      required BuildContext context,
      required UserRepository userRepository}) async {
    email = email.trim();
    password = password.trim();
    if (email.isEmpty) {
      ShowCustomSnackbar(
          title: "Email Required",
          message: "The email is required",
          backgroundColor: Colors.redAccent);
    } else if (password.isEmpty) {
      ShowCustomSnackbar(
          title: "Password Required",
          message: "The password is required",
          backgroundColor: Colors.redAccent);
    } else {
      ShowLoadingDialog(context, "Iniciando Sesión...");
      var resp = await userRepository.login(email, password);

      if (!resp.isError) {
        await Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop();
        });

        final ControllerUser controlleruser = Get.find();
        controlleruser.DataUser(resp.user!);

        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.of(context).pop();
        if (resp.message == "password incorrect") {
          ShowCustomSnackbar(
              title: "Password Incorrect",
              message: "The password is incorrect.",
              backgroundColor: Colors.redAccent);
        } else if (resp.message == "not exist") {
          ShowCustomSnackbar(
              title: "Unregistered",
              message: "The user is not registered in the system.",
              backgroundColor: Colors.redAccent);
        } else {
          ShowCustomSnackbar(
              title: "Error Login",
              message: "An error occurred while logging in to the user.",
              backgroundColor: Colors.redAccent);
        }
      }
    }
  }
  
}

