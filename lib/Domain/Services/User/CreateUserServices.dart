import 'package:flutter/material.dart';
import 'package:prueba_tecnica/Domain/Alerts/ShowCustomSnackbar.dart';
import 'package:prueba_tecnica/Domain/Alerts/showLoadingDialog.dart';
import 'package:prueba_tecnica/Domain/Models/User.dart';
import 'package:prueba_tecnica/Infrastructure/Repository/User/UserRepository.dart';

class CreateUserServices {

  static Future<void> createUser(
      {required String name,
      required var image,
      required String email,
      required String nationality,
      required String phone,
      required String password,
      required String birday,
      required BuildContext context,
      required UserRepository userRepository}) async {

    name = name.trim();
    email = email.trim();
    phone = phone.trim();
    password = password.trim();

    if (name.isEmpty) {
      ShowCustomSnackbar(
          title: "Name Required",
          message: "The name is required",
          backgroundColor: Colors.redAccent);
    } else if (email.isEmpty) {
      ShowCustomSnackbar(
          title: "Email Required",
          message: "The email is required",
          backgroundColor: Colors.redAccent);
    } else if (nationality.isEmpty) {
      ShowCustomSnackbar(
          title: "Nationality Required",
          message: "The nationality is required");
    } else if (phone.isEmpty) {
      ShowCustomSnackbar(
          title: "Phone Required",
          message: "The phone is required",
          backgroundColor: Colors.redAccent);
    } else if (password.isEmpty) {
      ShowCustomSnackbar(
          title: "Password Required",
          message: "The password is required",
          backgroundColor: Colors.redAccent);
    } else if (birday.isEmpty) {
      ShowCustomSnackbar(
          title: "Birthday Date Required",
          message: "The Birthday Date is required",
          backgroundColor: Colors.redAccent);
    } else if (!isValidEmail(email)) {
      ShowCustomSnackbar(
          title: "Invalid Email",
          message: "The email format is invalid",
          backgroundColor: Colors.redAccent);
    } else if (image == null) {
      ShowCustomSnackbar(
          title: "Select Image",
          message: "Please select an image for your account",
          backgroundColor: const Color.fromARGB(255, 59, 131, 212));
    } else {
      ShowLoadingDialog(context, "creating account...");

      User user = User(
          birthdayDateUser: "",
          nameUser: name,
          emailUser: email,
          imagenUser: "",
          nationalityUser: nationality,
          passwordUser: password,
          phoneUser: phone);

      String resp = await userRepository.addUser(user, image);
      Navigator.of(context).pop();
      if (resp == "create") {
        ShowCustomSnackbar(
            title: "User Create",
            message: "The user has successfully registered",
            backgroundColor: const Color.fromARGB(255, 74, 199, 80));
      } else if (resp == "exist") {
        ShowCustomSnackbar(
            title: "user exists",
            message: "The user is already registered",
            backgroundColor: const Color.fromARGB(255, 255, 174, 82));
      } else {
        ShowCustomSnackbar(
            title: "Error",
            message: "An error occurred while registering the user",
            backgroundColor: Colors.redAccent);
      }
    }
  }

}

bool isValidEmail(String email) {
  // Expresión regular para validar un correo electrónico
  final RegExp emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  // Retorna true si el email coincide con la regex, false en caso contrario
  return emailRegex.hasMatch(email);
}
