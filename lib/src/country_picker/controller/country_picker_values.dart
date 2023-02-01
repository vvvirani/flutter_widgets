part of 'country_picker_controller.dart';

class CountryPickerValues {
  final List<Country> countries;
  final List<CState> states;
  final List<Country> searchedCountries;
  final List<CState> searchedStates;
  final bool isSearching;

  CountryPickerValues({
    required this.countries,
    this.states = const [],
    this.searchedCountries = const [],
    this.searchedStates = const [],
    this.isSearching = false,
  });

  CountryPickerValues copyWith({
    List<Country>? countries,
    List<CState>? states,
    List<Country>? searchedCountries,
    List<CState>? searchedStates,
    bool? isSearching,
  }) {
    return CountryPickerValues(
      countries: countries ?? this.countries,
      states: states ?? this.states,
      searchedCountries: searchedCountries ?? this.searchedCountries,
      searchedStates: searchedStates ?? this.searchedStates,
      isSearching: isSearching ?? this.isSearching,
    );
  }
}
