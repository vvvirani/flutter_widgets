class Country {
  final String name;
  final num dialCode;
  final String code;

  Country({
    required this.name,
    required this.dialCode,
    required this.code,
  });

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      name: map['name'],
      dialCode: num.parse(map['dial_code']),
      code: map['code'],
    );
  }

  String get flag => 'assets/flags/${code.toLowerCase()}.png';
}
