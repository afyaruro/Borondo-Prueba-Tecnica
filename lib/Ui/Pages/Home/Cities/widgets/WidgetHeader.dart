import 'package:flutter/material.dart';
import 'package:prueba_tecnica/Infrastructure/Controllers/ControllerUser.dart';

class WidgetHeader extends StatelessWidget {
  const WidgetHeader({
    super.key,
    required this.controllerUser,
  });

  final ControllerUser controllerUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Destinations",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            padding: controllerUser.user?.imagenUser != null
                ? const EdgeInsets.only(top: 5)
                : const EdgeInsets.all(0),
            color: const Color(0xff00d0c1),
            width: 50,
            height: 50,
            child: controllerUser.user?.imagenUser == ""
                ? Image.asset("assets/user.png")
                : Image.network(
                    controllerUser.user!.imagenUser,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ],
    );
  }
}