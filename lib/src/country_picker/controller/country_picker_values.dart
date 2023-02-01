part of 'country_picker_controller.dart';

class CountryPickerValues {
  final List<Country> countries;
  final List<CState> states;
  final CountrySerachResult countrySerachResult;
  final StateSerachResult stateSerachResult;
  final bool isSearching;

  CountryPickerValues({
    required this.countries,
    this.states = const [],
    required this.countrySerachResult,
    required this.stateSerachResult,
    this.isSearching = false,
  });

  CountryPickerValues copyWith({
    List<Country>? countries,
    List<CState>? states,
    CountrySerachResult? countrySerachResult,
    StateSerachResult? stateSerachResult,
    bool? isSearching,
  }) {
    return CountryPickerValues(
      countries: countries ?? this.countries,
      states: states ?? this.states,
      countrySerachResult: countrySerachResult ?? this.countrySerachResult,
      stateSerachResult: stateSerachResult ?? this.stateSerachResult,
      isSearching: isSearching ?? this.isSearching,
    );
  }
}

class CountrySerachResult {
  final List<Country> countries;

  CountrySerachResult._({this.countries = const []});

  CountrySerachResult copyWith({List<Country>? countries}) {
    return CountrySerachResult._(countries: countries ?? this.countries);
  }

  CountrySerachResult.fromResult(List<Country> result) : countries = result;

  CountrySerachResult.empty() : countries = [];
}

class StateSerachResult {
  final List<CState> states;

  StateSerachResult._({this.states = const []});

  StateSerachResult copyWith({List<CState>? states}) {
    return StateSerachResult._(states: states ?? this.states);
  }

  StateSerachResult.fromResult(List<CState> result) : states = result;

  StateSerachResult.empty() : states = [];
}
