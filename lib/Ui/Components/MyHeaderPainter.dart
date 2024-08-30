import 'package:flutter/material.dart';

class MyHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = Color.fromARGB(255, 255, 255, 255)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.fill;

    final path = new Path();
    path.moveTo(0, 0);

    path.arcToPoint(
      Offset(20, 20),
      radius: Radius.circular(20),
      clockwise: false,
    );

    path.lineTo((size.width * 0.5) - 25, 20);

    path.arcToPoint(
      Offset((size.width * 0.5) - 15, 26),
      radius: Radius.circular(10),
      clockwise: true,
    );

    path.lineTo((size.width * 0.5) -5, 45);

    path.arcToPoint(
      Offset((size.width * 0.5), 47),
      radius: Radius.circular(5),
      clockwise: false,
    );

    path.arcToPoint(
      Offset((size.width * 0.5) + 5, 45),
      radius: Radius.circular(5),
      clockwise: false,
    );

    path.lineTo((size.width * 0.5) + 15, 26);

    path.arcToPoint(
      Offset((size.width * 0.5) + 25, 20),
      radius: Radius.circular(10),
      clockwise: true,
    );

    path.lineTo(size.width - 20, 20);

    path.arcToPoint(
      Offset(size.width, 0),
      radius: Radius.circular(20),
      clockwise: false,
    );

    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);

    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MyHeaderPainter oldDelegate) => true;
}