import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:population_app/services/service.dart';

class FilterNotifier extends ChangeNotifier {
  List<dynamic> _cities = [];
  FilterNotifierState _state = FilterNotifierState.Loading;

  UnmodifiableListView<dynamic> get cities =>
      UnmodifiableListView(_cities);
  bool get isLoading => _state == FilterNotifierState.Loading;
  bool get hasData => _state == FilterNotifierState.HasData;
  bool get empty => _state == FilterNotifierState.NotFound;

  Future<void> fetchCountry() async {
    _state = FilterNotifierState.Loading;
    notifyListeners();
    var response = await Services().getCountry();
    _cities = response;
    if (cities.isEmpty)
      _state = FilterNotifierState.NotFound;
    else
      _state = FilterNotifierState.HasData;

    notifyListeners();
  }

  Future<void> fetchFromCache() async {
    if (isLoading) fetchCountry();
  }
}

enum FilterNotifierState { Loading, HasData, NotFound }
