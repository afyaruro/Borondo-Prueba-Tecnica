
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/Domain/Alerts/ShowCustomSnackbar.dart';

class WidgetForgotPassword extends StatelessWidget {
  const WidgetForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        ShowCustomSnackbar(
            message:
                "Error la pantalla aun no esta desarrollada",
            title: "404 Not Found",
            backgroundColor:
                const Color.fromARGB(255, 44, 137, 224));
      },
      child: const Text(
        "Forgot your password?",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
    );
  }
}