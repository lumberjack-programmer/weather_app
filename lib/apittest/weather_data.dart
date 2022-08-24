class WeatherData {
  final location;
  // final String observation_time;
  // final int temperature;
  // final int weather_code;

  const WeatherData({required this.location});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      location: json['location']
    );
  }
}