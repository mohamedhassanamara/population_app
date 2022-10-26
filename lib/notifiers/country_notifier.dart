import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:population_app/services/service.dart';

class CountryNotifier extends ChangeNotifier {
  List<dynamic> _countries = [];
  CountriesNotifierState _state = CountriesNotifierState.Loading;

  UnmodifiableListView<dynamic> get countries =>
      UnmodifiableListView(_countries);
  bool get isLoading => _state == CountriesNotifierState.Loading;
  bool get hasData => _state == CountriesNotifierState.HasData;
  bool get empty => _state == CountriesNotifierState.NotFound;

  Future<void> fetchCountries() async {
    _state = CountriesNotifierState.Loading;
    notifyListeners();
    var response = await Services.getCountries();
    _countries = response;
    if (countries.isEmpty)
      _state = CountriesNotifierState.NotFound;
    else {
      _state = CountriesNotifierState.HasData;
    }

    notifyListeners();
  }

  Future<void> fetchFromCache() async {
    if (isLoading) fetchCountries();
  }
}

enum CountriesNotifierState { Loading, HasData, NotFound }
