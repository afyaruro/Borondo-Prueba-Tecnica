
import 'package:flutter/material.dart';

class WidgetOr extends StatelessWidget {
  const WidgetOr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: const Color(0xffb5b5b5),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            "or",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 1,
              color: const Color(0xffb5b5b5),
            ),
          ),
        ],
      ),
    );
  }
}