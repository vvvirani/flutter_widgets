import 'package:flutter/material.dart';
import 'package:flutter_widgets/src/country_picker/models/country.dart';
import 'package:flutter_widgets/src/country_picker/models/state.dart';
import 'package:flutter_widgets/src/country_picker/utils/country_utils.dart';

part 'country_picker_values.dart';

class CountryPickerController extends ValueNotifier<CountryPickerValues> {
  CountryPickerController()
      : super(
          CountryPickerValues(
            countries: CountryUtils.countries,
            countrySerachResult: CountrySerachResult.empty(),
            stateSerachResult: StateSerachResult.empty(),
            isSearching: false,
          ),
        );

  void onCountrySearched(String query) {
    if (query.isNotEmpty) {
      List<Country> result = value.countries.where((country) {
        return (country.name.toLowerCase()).contains(query.toLowerCase());
      }).toList();

      value = value.copyWith(
        isSearching: true,
        countrySerachResult: CountrySerachResult.fromResult(result),
      );
    } else {
      value = value.copyWith(
        isSearching: false,
        countrySerachResult: CountrySerachResult.empty(),
      );
    }
  }

  void onStateSearched(String query) {
    if (query.isNotEmpty) {
      List<CState> result = value.states.where((state) {
        return (state.name.toLowerCase()).contains(query.toLowerCase());
      }).toList();
      value = value.copyWith(
        isSearching: true,
        stateSerachResult: StateSerachResult.fromResult(result),
      );
    } else {
      value = value.copyWith(
        isSearching: false,
        stateSerachResult: StateSerachResult.empty(),
      );
    }
  }

  void getStates(Country country) {
    List<CState> states = CountryUtils.getStatesByCountyIos2Code(country.code);
    value = value.copyWith(states: states);
  }

  List<Country> get countries {
    return _isSearching ? value.countrySerachResult.countries : value.countries;
  }

  Country getCountryByIndex(int index) {
    return _isSearching
        ? value.countrySerachResult.countries.elementAt(index)
        : value.countries.elementAt(index);
  }

  List<CState> get cStates {
    return _isSearching ? value.stateSerachResult.states : value.states;
  }

  CState getStateByIndex(int index) {
    return _isSearching
        ? value.stateSerachResult.states.elementAt(index)
        : value.states.elementAt(index);
  }

  bool get _isSearching => value.isSearching;
}
