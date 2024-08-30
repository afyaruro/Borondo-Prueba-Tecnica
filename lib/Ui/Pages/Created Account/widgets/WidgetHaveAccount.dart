import 'package:flutter/material.dart';

class WidgetHaveAccount extends StatelessWidget {
  const WidgetHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account? "),
        InkWell(
          child: const Text(
            "Sign in",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff00d0c1)),
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        )
      ],
    );
  }
}
