import 'package:flutter/material.dart';

class WeatherModel {

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

}
