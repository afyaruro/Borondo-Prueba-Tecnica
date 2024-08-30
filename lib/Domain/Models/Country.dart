class Country {

  final String imageCountry;
  final String nameCountry;
  final int citiesCountry;
  final int citiesCompleteCountry;
  final int famousPlacesCountry;
  final int famousPlacesCompleteCountry;
  final int traveledCountry;
  final String estadoCountry;

  Country({
    required this.estadoCountry,
    required this.imageCountry,
    required this.nameCountry,
    required this.citiesCountry,
    required this.citiesCompleteCountry,
    required this.famousPlacesCountry,
    required this.famousPlacesCompleteCountry,
    required this.traveledCountry,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': imageCountry,
      'name': nameCountry,
      'cities': citiesCountry,
      'citiesComplete': citiesCompleteCountry,
      'famousPlaces': famousPlacesCountry,
      'famousPlacesComplete': famousPlacesCompleteCountry,
      'traveled': traveledCountry,
      'estado': estadoCountry
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      imageCountry: map['image'] ?? '',
      nameCountry: map['name'] ?? '',
      citiesCountry: map['cities'] ?? 0,
      citiesCompleteCountry: map['citiesComplete'] ?? 0,
      famousPlacesCountry: map['famousPlaces'] ?? 0,
      famousPlacesCompleteCountry: map['famousPlacesComplete'] ?? 0,
      traveledCountry: map['traveled'] ?? 0,
      estadoCountry: map['estado'] ?? 0

    );
  }
}
