import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/apittest/weather_data.dart';


class ApiTest {

  // {
  // "request": {
  // "type": "City",
  // "query": "New York, United States of America",
  // "language": "en",
  // "unit": "m"
  // },

  // http.get(Uri.parse('http://api.weatherstack.com/current?access_key=79721683f0f1acb61035af86f8e877be&query=New%20York'),
  // headers: {'access_key' : '79721683f0f1acb61035af86f8e877be'});

  Future<WeatherData> fetchAlbum() async {
    final response = await http.get(Uri.parse('http://api.weatherstack.com/current?access_key=79721683f0f1acb61035af86f8e877be&query=New York'));



    if (response.statusCode == 200) {
        return WeatherData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }

  }


}
