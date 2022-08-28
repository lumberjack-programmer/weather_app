import 'package:flutter/material.dart';

class WeatherModel {




  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  //Clouds
  //Rain
  //Clear

  static String getWeatherImage(String indicator) {
      if (indicator.toLowerCase() == 'clouds'){
        return 'images/cloud/35.png';
      } else if (indicator.toLowerCase() == 'rain') {
        return 'images/cloud/7.png';
      } else if (indicator.toLowerCase() == 'clear') {
        return 'images/sun/26.png';
      } else if (indicator.toLowerCase() == 'snow') {
        return 'images/cloud/18.png';
      }

      return 'images/day.png';
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
