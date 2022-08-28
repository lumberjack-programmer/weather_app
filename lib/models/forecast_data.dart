

class ForecastData{
  final list;
  final city;
  // final String observation_time;
  // final int temperature;
  // final int weather_code;

  ForecastData({required this.list, required this.city});

  factory ForecastData.fromJson(Map<String, dynamic> json) {
    return ForecastData(
      list: json['list'],
      city: json['city'],
    );
  }
}