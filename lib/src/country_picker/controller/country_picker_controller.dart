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
            isSearching: false,
          ),
        );

  void onCountrySearched(String query) {
    if (query.isNotEmpty) {
      List<Country> result = value.countries.where((country) {
        return (country.name.toLowerCase()).contains(query.toLowerCase());
      }).toList();

      value = value.copyWith(isSearching: true, searchedCountries: result);
    } else {
      value = value.copyWith(isSearching: false, searchedCountries: []);
    }
  }

  void onStateSearched(String query) {
    if (query.isNotEmpty) {
      List<CState> result = value.states.where((state) {
        return (state.name.toLowerCase()).contains(query.toLowerCase());
      }).toList();
      value = value.copyWith(isSearching: true, searchedStates: result);
    } else {
      value = value.copyWith(isSearching: false, searchedStates: []);
    }
  }

  void getStates(Country country) {
    List<CState> states = CountryUtils.getStatesByCountyIos2Code(country.code);
    value = value.copyWith(states: states);
  }

  List<Country> get countries {
    return _isSearching ? value.searchedCountries : value.countries;
  }

  Country getCountryByIndex(int index) {
    return _isSearching
        ? value.searchedCountries.elementAt(index)
        : value.countries.elementAt(index);
  }

  List<CState> get cStates {
    return _isSearching ? value.searchedStates : value.states;
  }

  CState getStateByIndex(int index) {
    return _isSearching
        ? value.searchedStates.elementAt(index)
        : value.states.elementAt(index);
  }

  bool get _isSearching => value.isSearching;
}
