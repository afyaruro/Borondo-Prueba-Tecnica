
import 'dart:io';

import 'package:flutter/material.dart';

class WidgetTextImage extends StatelessWidget {
  final File? image;
  final VoidCallback onCameraPressed;

  const WidgetTextImage({
    Key? key,
    this.image,
    required this.onCameraPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Account",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
              Text("provides basic data", style: TextStyle(fontSize: 13))
            ],
          ),
          Container(
            width: 90,
            child: Stack(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  padding: image == null
                      ? const EdgeInsets.only(top: 10)
                      : const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffd9d9d9),
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(40),
                      color: const Color(0xff00d0c1)),
                  child: ClipOval(
                    child: image == null
                        ? Image.asset(
                            "assets/user.png",
                            width: 80,
                            height: 80,
                            fit: BoxFit.contain,
                          )
                        : Image.file(image!,
                            width: 80, height: 80, fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 14, 144, 196),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: onCameraPressed,
                      icon: const Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                        size: 25,
                      ),
                      iconSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
