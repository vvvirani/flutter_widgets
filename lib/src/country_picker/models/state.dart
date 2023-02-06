class CState {
  final int id;
  final String name;
  final int countryId;
  final String countryCode;
  final String? countryName;
  final String stateCode;
  final dynamic type;
  final String? latitude;
  final String? longitude;

  CState({
    required this.id,
    required this.name,
    required this.countryId,
    required this.countryCode,
    this.countryName,
    required this.stateCode,
    this.latitude,
    this.longitude,
    this.type,
  });

  factory CState.fromMap(Map<String, dynamic> map) {
    return CState(
      id: map['id'],
      name: map['name'],
      countryId: map['country_id'],
      countryCode: map['country_code'],
      countryName: map['country_name'],
      stateCode: map['state_code'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}
