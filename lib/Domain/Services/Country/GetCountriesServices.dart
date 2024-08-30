import 'package:prueba_tecnica/Domain/Models/Country.dart';
import 'package:prueba_tecnica/Infrastructure/Repository/Country/CountryRepository.dart';

class GetCountriesServices {

  static Future<List<Country>> GetCountries({required CountryRepository countryRepository}) async {
    return await countryRepository.getCountries();
  }
}