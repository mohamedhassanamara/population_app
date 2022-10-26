import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/city.dart';
import '../models/country.dart';

class Services {
  Future<List> getCities() async {
    var client = http.Client();
    List<Country> countries = [];
    var response1 = await client.get(
      Uri.parse('https://countriesnow.space/api/v0.1/countries/flag/images'),
    );
    final jsonString1 = response1.body;
    final jsonArray1 = jsonDecode(jsonString1)['data'];
    jsonArray1.forEach((jsonMap) => {countries.add(Country.fromJson(jsonMap))});

    var cities = [];
    var response2 = await client.get(
      Uri.parse(
          'https://countriesnow.space/api/v0.1/countries/population/cities'),
    );
    final jsonString = response2.body;
    final jsonArray = jsonDecode(jsonString)['data'];
    print(jsonArray[0]['country']);
    jsonArray
        .forEach((jsonMap) => {cities.add(City.fromJson(jsonMap, countries))});

    return cities;
  }
  Future<List> getCountries() async {
    var client = http.Client();
    List<Country> countries = [];
    var response1 = await client.get(
      Uri.parse('https://countriesnow.space/api/v0.1/countries/flag/images'),
    );
    final jsonString1 = response1.body;
    final jsonArray1 = jsonDecode(jsonString1)['data'];
    jsonArray1.forEach((jsonMap) => {countries.add(Country.fromJson(jsonMap))});
    return countries;
  }


  Future<List> getCountry() async {
    var client = http.Client();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Country country = Country(name: prefs.getString('name')??'', flag: prefs.getString('flag')??'');

    var cities = [];
    var response2 = await client.get(
      Uri.parse(
          'https://countriesnow.space/api/v0.1/countries/population/cities'),
    );
    final jsonString = response2.body;
    final jsonArray = jsonDecode(jsonString)['data'];
    jsonArray
        .forEach((jsonMap) => {cities.add(City.fromJson(jsonMap, [country]))});

    return cities.where((element) => element.name == country.name).toList();
  }
}
