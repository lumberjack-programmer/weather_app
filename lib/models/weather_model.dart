class WeatherModelData {

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
  final List weatherDayList;


  WeatherModelData(
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
  this.temp_max,
      this.weatherDayList);

}




// localtime = forecastData.list[0]['dt_txt'];
// currentTemp = forecastData.list[0]['main']['temp'];
// weather_descriptions = forecastData.list[0]['weather'][0]['description'];
// wind_speed = forecastData.list[0]['wind']['speed'];
// wind_degree = forecastData.list[0]['wind']['deg'];
// pressure = forecastData.list[0]['main']['pressure'];
// humidity = forecastData.list[0]['main']['humidity'];
// feelslike = forecastData.list[0]['main']['feels_like'];
// visibility = forecastData.list[0]['visibility'];
// timeDate = forecastData.list[0]['dt_txt'];
// sea_level = forecastData.list[0]['main']['sea_level'];
// grnd_level = forecastData.list[0]['main']['grnd_level'];
// temp_min = forecastData.list[0]['main']['temp_min'];
// cloudiness = forecastData.list[0]['clouds']['all'];