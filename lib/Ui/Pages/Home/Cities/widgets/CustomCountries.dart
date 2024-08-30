// import 'package:flutter/material.dart';
// import 'package:prueba_tecnica/Domain/Models/Country.dart';
// import 'package:prueba_tecnica/Domain/Services/CountryService.dart';

// class CustomCountries extends StatefulWidget {
//   const CustomCountries({super.key});

//   @override
//   _CustomCountriesState createState() => _CustomCountriesState();
// }

// class _CustomCountriesState extends State<CustomCountries> {
//   late Future<List<Country>> _futureCountries;

//   @override
//   void initState() {
//     super.initState();
//     final CountryServices _countryServices = CountryServices();
//     _futureCountries = _countryServices.GetCountries();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Country>>(
//       future: _futureCountries,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return const Center(child: Text('Error al cargar países.'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text('No hay países disponibles.'));
//         } else {
//           return SingleChildScrollView(
//             child: IntrinsicHeight(
//               child: Column(
//                 children: [
//                   for (var country in snapshot.data!)
//                     CustomCard(
//                       country: country,
//                     ),
//                   const SizedBox(height: 80),
//                 ],
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:prueba_tecnica/Domain/Models/Country.dart';

class CustomCountries extends StatelessWidget {
  final List<Country> countries;

  const CustomCountries({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: Column(
          children: [
            for (var country in countries)
              CustomCard(
                country: country,
              ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final Country? country;

  const CustomCard({
    super.key,
    this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 400,
          height: 120,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(218, 168, 168, 168).withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
              ),
            ],
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: Image.network(country!.imageCountry,
                        width: 100, height: 120, fit: BoxFit.cover),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        country!.nameCountry,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Cities",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffA9A9A9),
                                    fontSize: 11),
                              ),
                              Text(
                                "${country!.citiesCountry}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffA9A9A9),
                                    fontSize: 17),
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffd9f8f6),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    width: 15,
                                    height: 15,
                                    child: Center(
                                      child: Text(
                                        "${country!.citiesCompleteCountry}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff00D0C1),
                                            fontSize: 11),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    " Complete",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff00D0C1),
                                        fontSize: 11),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Famous places",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffA9A9A9),
                                    fontSize: 11),
                              ),
                              Text(
                                "${country!.famousPlacesCountry}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffA9A9A9),
                                    fontSize: 17),
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffd9f8f6),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    width: 15,
                                    height: 15,
                                    child: Center(
                                      child: Text(
                                        "${country!.famousPlacesCompleteCountry}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff00D0C1),
                                            fontSize: 11),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    " Complete",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff00D0C1),
                                        fontSize: 11),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Traveled",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffA9A9A9),
                                    fontSize: 11),
                              ),
                              Text(
                                "${country!.traveledCountry}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffA9A9A9),
                                    fontSize: 17),
                              ),
                              const Text(
                                "km",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffA9A9A9),
                                    fontSize: 11),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              country!.estadoCountry == "Completed"
                  ? Positioned(top: 0, right: 0, child: CustomCompleted())
                  : Container()
            ],
          ),
        ),
      ],
    );
  }
}

class CustomCompleted extends StatelessWidget {
  const CustomCompleted({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topRight: Radius.circular(10)),
      child: Stack(
        children: [
          Container(
            width: 40,
            height: 40,
            child: CustomPaint(
              painter: CustomCompletedPainter(),
            ),
          ),
          const Positioned(
              top: 4,
              right: 4,
              child: Icon(
                Icons.check,
                color: Colors.black,
                size: 17,
              ))
        ],
      ),
    );
  }
}

class CustomCompletedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = const Color(0xff00d0c1)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.fill;

    final path = new Path();
    path.moveTo(0, 0);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomCompletedPainter oldDelegate) => true;
}
