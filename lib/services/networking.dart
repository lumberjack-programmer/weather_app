import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/city_number.dart';
import 'package:weather_app/models/forecast_data.dart';
import '../config/config.dart';
import '../models/city_model.dart';

const String baseApiUrl = 'https://api.openweathermap.org/data/2.5/forecast';

class ApiService {

  Future<ForecastData> fetchForecastInfoForLocation(double latitude, double longitude) async {

    final response = await http.get(Uri.parse('$baseApiUrl?lat=$latitude&lon=$longitude&appid=$API_KEY&units=metric'));

    return _checkStatus(response);
  }

  //https://api.openweathermap.org/data/2.5/forecast?id=5174&mode=json&appid=51d2e29f4181530ee1e5223365412e1c&units=metric
  Future<ForecastData> fetchForecastInfoByCountry(CityIdModel cityFound) async {
    num countryId = cityFound.id;
    final response = await http.get(Uri.parse('$baseApiUrl?id=$countryId&mode=json&appid=$API_KEY&units=metric'));

    return _checkStatus(response);
  }

  Future<CityModel> fetchAllCitiesFromLocalJson() async {

    final String response = await rootBundle.loadString('local/cities/city.list.json');
    final data = await json.decode(response);
    return CityModel.fromJson(data);
  }


  _checkStatus(http.Response response) {
    if (response.statusCode == 200) {
      return ForecastData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch data');
    }
  }


}
