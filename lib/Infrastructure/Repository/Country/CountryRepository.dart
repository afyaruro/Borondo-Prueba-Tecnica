import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba_tecnica/Domain/Models/Country.dart';
import 'package:prueba_tecnica/Infrastructure/Repository/Country/GetCountries.dart';

class CountryRepository {
  final CollectionReference _countriesCollection =
      FirebaseFirestore.instance.collection('countries');

  Future<List<Country>> getCountries() async {
    return GetCountries.getCountries(_countriesCollection);
  }
}
