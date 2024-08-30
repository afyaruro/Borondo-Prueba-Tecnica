import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function function;
  final Color color;
  final Color colorText;

  const CustomButton(
      {super.key,
      required this.text,
      required this.function,
      required this.color, required this.colorText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      margin: const EdgeInsets.only(left: 25, right: 25),
      child: ElevatedButton(
        onPressed: () {
          function();
        },
        child: Text(text,
            style: TextStyle(fontWeight: FontWeight.w900, color: colorText)),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(color),
        ),
      ),
    );
  }
}
