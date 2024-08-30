import 'package:flutter/material.dart';
import 'package:prueba_tecnica/Ui/Components/MyHeaderPainter.dart';

class CustomHeader extends StatelessWidget {
  final double height;
  final bool gradient;

  const CustomHeader({super.key, this.height = 320, this.gradient = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: Stack(
        children: [
          Image.asset(
            "assets/header-fondo.png",
            width: MediaQuery.of(context).size.width,
            height: height,
            fit: BoxFit.cover,
          ),
          gradient
              ? Positioned(
                  top: 0,
                  child: Container(
                    height: height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Color.fromARGB(139, 0, 0, 0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ))
              : Container(),
          Positioned(
              bottom: 50,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome to",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Image.asset(
                      "assets/Logo-borondo.png",
                      width: 250,
                      height: 70,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              )),
          Positioned(
              bottom: 0,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  painter: MyHeaderPainter(),
                ),
              ))
        ],
      ),
    );
  }
}
