import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba_tecnica/Domain/Models/Country.dart';

class GetCountries {

  static Future<List<Country>> getCountries(CollectionReference _countriesCollection) async {
    try {
      QuerySnapshot querySnapshot = await _countriesCollection.get();
      List<Country> countries = querySnapshot.docs.map((doc) {
        return Country.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
      return countries;
    } catch (e) {
      print("Error al obtener países: $e");
      return [];
    }
  }
}