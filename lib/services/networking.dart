import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_data.dart';
import 'package:weather_app/models/forecast_data.dart';
import 'package:weather_app/services/location.dart';


class ApiService {

  // {
  // "request": {
  // "type": "City",
  // "query": "New York, United States of America",
  // "language": "en",
  // "unit": "m"
  // },

  // http.get(Uri.parse('http://api.weatherstack.com/current?access_key=79721683f0f1acb61035af86f8e877be&query=New%20York'),
  // headers: {'access_key' : '79721683f0f1acb61035af86f8e877be'});




  // Uncomment before recording
  // Future<WeatherData> fetchCityLocation() async {
  //   final locationResponse = await http.get(Uri.parse('http://api.weatherstack.com/current?access_key=79721683f0f1acb61035af86f8e877be&query=New York'));
  //
  //   if (locationResponse.statusCode == 200) {
  //       return WeatherData.fromJson(jsonDecode(locationResponse.body));
  //   } else {
  //     throw Exception('Failed to fetch data');
  //   }
  //
  // }





  Future<WeatherData> fetchCityLocation() async {
    final locationResponse = await http.get(Uri.parse('https://api.openweathermap.org/geo/1.0/direct?q=New York&limit=200&appid=51d2e29f4181530ee1e5223365412e1c'));

    if (locationResponse.statusCode == 200) {
        return WeatherData.fromJson(jsonDecode(locationResponse.body));
    } else {
      throw Exception('Failed to fetch data');
    }

  }

  Future<ForecastData> fetchForecastInfoForLocation(double latitude, double longitude) async {

    print(latitude);
    print(longitude);

    // print('https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=51d2e29f4181530ee1e5223365412e1c');
    // final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=37.33233141&lon=-122.0312186&appid=51d2e29f4181530ee1e5223365412e1c'));
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=51d2e29f4181530ee1e5223365412e1c'));

    if (response.statusCode == 200) {
      return ForecastData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<ForecastData> fetchForecastInfoByCountry(String countryName) async {
    //https://api.openweathermap.org/data/2.5/forecast?q=London,us&mode=json&appid=51d2e29f4181530ee1e5223365412e1c

    print(countryName);
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$countryName,us&mode=json&appid=51d2e29f4181530ee1e5223365412e1c'));

    if (response.statusCode == 200) {
      return ForecastData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch data');
    }
  }






}
