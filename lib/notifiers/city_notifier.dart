import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:population_app/services/service.dart';

class CityNotifier extends ChangeNotifier {
  List<dynamic> _cities = [];
  CitiesNotifierState _state = CitiesNotifierState.Loading;

  UnmodifiableListView<dynamic> get cities =>
      UnmodifiableListView(_cities);
  bool get isLoading => _state == CitiesNotifierState.Loading;
  bool get hasData => _state == CitiesNotifierState.HasData;
  bool get empty => _state == CitiesNotifierState.NotFound;

  Future<void> fetchCities() async {
    _state = CitiesNotifierState.Loading;
    notifyListeners();
    var response = await Services.getCities();
    _cities = response;
    if (cities.isEmpty)
      _state = CitiesNotifierState.NotFound;
    else {
      _state = CitiesNotifierState.HasData;
    }

    notifyListeners();
  }

  Future<void> fetchFromCache() async {
    if (isLoading) fetchCities();
  }
}

enum CitiesNotifierState { Loading, HasData, NotFound }
