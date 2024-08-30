import 'package:flutter/material.dart';
import 'package:prueba_tecnica/Ui/Pages/Home/Cities/Cities.dart';
import 'package:prueba_tecnica/Ui/Pages/Screen%20False/ScreenFalse.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Cities(),
    const ScreenFalse(nameRuta: "Routes"),
    const ScreenFalse(nameRuta: "Map"),
    const ScreenFalse(nameRuta: "Other")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _screens[_currentIndex],
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xff00d0c1),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 153, 153, 153)
                        .withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildMenuItem(
                        icon: "assets/cities.png",
                        iconSelected: "assets/cities_selected.png",
                        label: 'Cities',
                        index: 0),
                    _buildMenuItem(
                        icon: "assets/routes.png",
                        iconSelected: "assets/routes_selected.png",
                        label: 'Routes',
                        index: 1),
                    _buildMenuItem(
                        icon: "assets/map.png",
                        iconSelected: "assets/map_selected.png",
                        label: 'Map',
                        index: 2),
                    _buildMenuItem(
                        icon: "assets/other.png",
                        iconSelected: "assets/other_selected.png",
                        label: 'Other',
                        index: 3),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      {required String icon,
      required String iconSelected,
      required String label,
      required int index}) {
    bool isSelected = _currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _currentIndex = index;
          });
        },
        child: Container(
          color: isSelected
              ? const Color.fromARGB(255, 255, 255, 255)
              : Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                isSelected ? iconSelected : icon,
                width: 25,
              ),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: isSelected
                      ? const Color(0xff00d0c1)
                      : const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
