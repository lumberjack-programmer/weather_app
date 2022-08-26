

class ForecastData{
  final list;
  // final String observation_time;
  // final int temperature;
  // final int weather_code;

  ForecastData({required this.list});

  factory ForecastData.fromJson(Map<String, dynamic> json) {
    return ForecastData(
      list: json['list'],
    );
  }
}