import 'dart:convert';

class CountryInfo {

  final int id;
  final String cityName;
  final double latitude;
  final double longitude;

  CountryInfo({
    required this.id,
    required this.cityName,
    required this.latitude,
    required this.longitude
  });

  // For API
  // factory CountryInfo.fromJson(Map<String, dynamic>) {
  //   return CountryInfo(
  //     cityName: json['city_name'],
  //   );
  // }

}