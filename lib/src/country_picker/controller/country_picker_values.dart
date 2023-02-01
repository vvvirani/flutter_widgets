part of 'country_picker_controller.dart';

class CountryPickerValues {
  final List<Country> countries;
  final List<CState> states;
  final CountrySearchResultValue searchResultValue;
  final bool isSearching;

  CountryPickerValues({
    required this.countries,
    required this.searchResultValue,
    this.states = const [],
    this.isSearching = false,
  });

  CountryPickerValues copyWith({
    List<Country>? countries,
    List<CState>? states,
    CountrySearchResultValue? searchResultValue,
    bool? isSearching,
  }) {
    return CountryPickerValues(
      countries: countries ?? this.countries,
      states: states ?? this.states,
      searchResultValue: searchResultValue ?? this.searchResultValue,
      isSearching: isSearching ?? this.isSearching,
    );
  }
}

class CountrySearchResultValue {
  final List<Country> countries;
  final List<CState> states;

  CountrySearchResultValue({this.countries = const [], this.states = const []});

  CountrySearchResultValue.empty()
      : countries = [],
        states = [];
}
