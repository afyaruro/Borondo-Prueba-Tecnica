import 'package:flutter/material.dart';

class CustomOptions extends StatefulWidget {
  final Function(int num) function;
  const CustomOptions({super.key, required this.function});

  @override
  State<CustomOptions> createState() => _CustomOptionsState();
}

class _CustomOptionsState extends State<CustomOptions> {
  bool isCountriesSelected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffd9f8f6),
      ),
      child: Row(
        children: [
          // Botón de "Countries"
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isCountriesSelected = true;
                  widget.function(0);
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: isCountriesSelected
                      ? const Color(0xff00d0c1)
                      : const Color(0xffd9f8f6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Countries",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isCountriesSelected
                          ? Colors.white
                          : const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Botón de "Cities"
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isCountriesSelected = false;
                  widget.function(1);
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: isCountriesSelected
                      ? const Color(0xffd9f8f6)
                      : const Color(0xff00d0c1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Cities",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isCountriesSelected
                          ? const Color.fromARGB(255, 0, 0, 0)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
