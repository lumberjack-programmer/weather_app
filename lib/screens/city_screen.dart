import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/apittest/weather_data.dart';
import 'package:weather_app/services/networking.dart';
import '../services/location.dart';
import '../components/weather_parameter.dart';

class CityScreen extends StatefulWidget {

  final String cityName;
  final double currentTemp;
  final String localtime;
  final String weather_descriptions;
  final double wind_speed;
  final int wind_degree;
  final int pressure;
  final int humidity;
  final double feelslike;
  final int visibility;
  final int cloudiness;
  final String timeDate;
  final int sea_level;
  final int grnd_level;
  final double temp_min;
  final double temp_max;


  CityScreen(
      this.cityName,
      this.currentTemp,
      this.localtime,
      this.weather_descriptions,
      this.wind_speed,
      this.wind_degree,
      this.pressure,
      this.humidity,
      this.feelslike,
      this.visibility,
      this.cloudiness,
      this.timeDate,
      this.sea_level,
      this.grnd_level,
      this.temp_min,
      this.temp_max);


  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {





  @override
  void initState() {
    super.initState();
    getLocation();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
    );
  }
}
