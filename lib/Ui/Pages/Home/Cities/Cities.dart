import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica/Infrastructure/Controllers/ControllerUser.dart';
import 'package:prueba_tecnica/Ui/Components/CustomSearchBar.dart';
import 'package:prueba_tecnica/Ui/Pages/Home/Cities/widgets/CustomCities.dart';
import 'package:prueba_tecnica/Ui/Pages/Home/Cities/widgets/CustomCountries.dart';
import 'package:prueba_tecnica/Ui/Components/CustomOptions.dart';
import 'package:prueba_tecnica/Domain/Models/Country.dart';
import 'package:prueba_tecnica/Domain/Services/Country/CountryService.dart';
import 'package:prueba_tecnica/Ui/Pages/Home/Cities/widgets/WidgetFilter.dart';
import 'package:prueba_tecnica/Ui/Pages/Home/Cities/widgets/WidgetHeader.dart';

class Cities extends StatefulWidget {
  const Cities({super.key});

  @override
  _CitiesState createState() => _CitiesState();
}

class _CitiesState extends State<Cities> {
  int _currentIndex = 0;
  String _selectedFilter = "All";
  String _searchQuery = "";
  List<Country> allCountries = [];
  List<Country> filteredCountries = [];

  @override
  void initState() {
    super.initState();
    _fetchCountries();
  }

  void _fetchCountries() async {
    final CountryServices _countryServices = CountryServices();
    allCountries = await _countryServices.GetCountries();
    _applyFilter();
  }

  void _applyFilter() {
    setState(() {
      filteredCountries = allCountries.where((country) {
        final matchesStatus = _selectedFilter == "All" ||
            (_selectedFilter == "Completed" &&
                country.estadoCountry == "Completed") ||
            (_selectedFilter == "Not Completed" &&
                country.estadoCountry == "Not Completed");

        final matchesQuery = country.nameCountry
            .toLowerCase()
            .contains(_searchQuery.toLowerCase());

        return matchesStatus && matchesQuery;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ControllerUser controllerUser = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [

            WidgetHeader(controllerUser: controllerUser),

            CustomSearchBar(
              icon: Icons.search_rounded,
              text: "Search",
              onSearchChanged: (query) {
                setState(() {
                  _searchQuery = query;
                  _applyFilter();
                });
              },
            ),
            const SizedBox(height: 10),

            CustomOptions(
              function: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),

            WidgetFilter(
              selectedFilter: _selectedFilter,
              onFilterSelected: (filter) {
                setState(() {
                  _selectedFilter = filter;
                  _applyFilter();
                });
              },
            ),

            Expanded(
                child: _currentIndex == 0
                    ? CustomCountries(countries: filteredCountries)
                    : const CustomCities()),

          ],
        ),
      ),
    );
  }
}




