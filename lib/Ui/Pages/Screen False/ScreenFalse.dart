import 'package:flutter/material.dart';

class ScreenFalse extends StatelessWidget {
  final String nameRuta;
  const ScreenFalse({super.key, required this.nameRuta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Text(
        nameRuta,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      )),
    );
  }
}
