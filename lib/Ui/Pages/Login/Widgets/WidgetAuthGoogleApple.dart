

import 'package:flutter/material.dart';
import 'package:prueba_tecnica/Domain/Alerts/ShowCustomSnackbar.dart';

class WidgetAuthGoogleApple extends StatelessWidget {
  const WidgetAuthGoogleApple({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            ShowCustomSnackbar(
                message:
                    "Error la pantalla aun no esta desarrollada",
                title: "404 Not Found",
                backgroundColor: const Color.fromARGB(
                    255, 44, 137, 224));
          },
          child: Image.asset(
            "assets/icon-google.png",
            width: 30,
            height: 30,
          ),
        ),
        TextButton(
          onPressed: () {
            ShowCustomSnackbar(
                message:
                    "Error la pantalla aun no esta desarrollada",
                title: "404 Not Found",
                backgroundColor: const Color.fromARGB(
                    255, 44, 137, 224));
          },
          child: Image.asset(
            "assets/icon-apple.png",
            width: 30,
            height: 30,
          ),
        ),
      ],
    );
  }
}
