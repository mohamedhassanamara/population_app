import 'country.dart';

class City {
  final String name;
  final String country;
  final List population;
  City({
    required this.name,
    required this.country,
    required this.population,
  });
  factory City.fromJson(Map<String, dynamic> json, List<Country> list) {
    return City(
      name: json["city"],
      population: json["populationCounts"],
      country: list
          .firstWhere((element) => element.name == json['country'],
              orElse: () => Country(
                  name: json['country'],
                  flag:
                      "https://upload.wikimedia.org/wikipedia/commons/9/9a/Flag_of_Afghanistan.svg"))
          .flag,
    );
  }
}
