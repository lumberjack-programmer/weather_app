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
}