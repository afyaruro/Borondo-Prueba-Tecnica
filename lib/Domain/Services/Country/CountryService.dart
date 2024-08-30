import 'package:prueba_tecnica/Domain/Models/Country.dart';
import 'package:prueba_tecnica/Domain/Services/Country/GetCountriesServices.dart';
import 'package:prueba_tecnica/Infrastructure/Repository/Country/CountryRepository.dart';

class CountryServices {
  final CountryRepository _countryRepository = CountryRepository();

  Future<List<Country>> GetCountries() async {
    return await GetCountriesServices.GetCountries(countryRepository: _countryRepository);
  }
}
