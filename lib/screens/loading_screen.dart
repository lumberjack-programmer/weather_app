import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/forecast_data.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/services/networking.dart';
import '../services/location.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class LoadingScreen extends StatefulWidget {

  // double? latitude = 0.0;
  // double? longitude = 0.0;
  String? cityName;


  LoadingScreen({this.cityName});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    if (widget.cityName == null) {
      getLocation();
    } else {
      cityName = widget.cityName!;
      print('else ${widget.cityName}');
      // getForecastInfoForLocation(widget.latitude!, widget.longitude!);
      getForecastInfoByCountryName(cityName);
    }

  }

  late String cityName = '';
  late num currentTemp;
  late String localtime = '';
  late String weather_descriptions = '';
  late double wind_speed = 0;
  late int wind_degree = 0;
  late int pressure = 0;
  late int humidity = 0;
  late double feelslike = 0;
  late int visibility = 0;
  late int cloudiness = 0;
  late String timeDate = '';
  late int sea_level = 0;
  late int grnd_level = 0;
  late num  temp_min = 0;
  late num temp_max = 0;
  late String iconIndicator = '';
  late List<dynamic> weatherDayList = [
  ];

  void getLocation() async {
    await Geolocator.requestPermission();
    Location location = Location();
    await location.getCurrentLocation(LocationAccuracy.low);
    getForecastInfoForLocation(location.latitude, location.longitude);
  }


  void getForecastInfoByCountryName(String name) async {
    print('Before fetching: $name');
    await Geolocator.requestPermission();
    ApiService apiService = ApiService();
    ForecastData forecastData = await apiService.fetchForecastInfoByCountry(name);

    print('${forecastData.city['name']}');

    setState(() {
      currentTemp = forecastData.list[0]['main']['temp'];
      localtime = forecastData.list[0]['dt_txt'];
      weather_descriptions = forecastData.list[0]['weather'][0]['description'];
      wind_speed = forecastData.list[0]['wind']['speed'];
      wind_degree = forecastData.list[0]['wind']['deg'];
      pressure = forecastData.list[0]['main']['pressure'];
      humidity = forecastData.list[0]['main']['humidity'];
      feelslike = forecastData.list[0]['main']['feels_like'];
      visibility = forecastData.list[0]['visibility'];
      timeDate = forecastData.list[0]['dt_txt'];
      sea_level = forecastData.list[0]['main']['sea_level'];
      grnd_level = forecastData.list[0]['main']['grnd_level'];
      temp_min = forecastData.list[0]['main']['temp_min'];
      cloudiness = forecastData.list[0]['clouds']['all'];
      iconIndicator = forecastData.list[0]['weather'][0]['main'];
      temp_max = forecastData.list[0]['main']['temp_max'];
      cityName = forecastData.city['name'];
      weatherDayList = forecastData.list;

    });
  }

  void getForecastInfoForLocation(double latitude, double longitude) async {
    print(latitude);
    print(longitude);
    await Geolocator.requestPermission();
    ApiService apiService = ApiService();
    ForecastData forecastData =  await apiService.fetchForecastInfoForLocation(latitude, longitude);

    setState(() {
      currentTemp = forecastData.list[0]['main']['temp'];
      localtime = forecastData.list[0]['dt_txt'];
      weather_descriptions = forecastData.list[0]['weather'][0]['description'];
      wind_speed = forecastData.list[0]['wind']['speed'];
      wind_degree = forecastData.list[0]['wind']['deg'];
      pressure = forecastData.list[0]['main']['pressure'];
      humidity = forecastData.list[0]['main']['humidity'];
      feelslike = forecastData.list[0]['main']['feels_like'];
      visibility = forecastData.list[0]['visibility'];
      timeDate = forecastData.list[0]['dt_txt'];
      sea_level = forecastData.list[0]['main']['sea_level'];
      grnd_level = forecastData.list[0]['main']['grnd_level'];
      temp_min = forecastData.list[0]['main']['temp_min'];
      cloudiness = forecastData.list[0]['clouds']['all'];
      iconIndicator = forecastData.list[0]['weather'][0]['main'];
      temp_max = forecastData.list[0]['main']['temp_max'];
      cityName = forecastData.city['name'];
      weatherDayList = forecastData.list;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('CLIMA'),
        leading: GestureDetector(child: Icon(Icons.navigation),onTap: () {
          getLocation();
        },),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: IconButton(
                splashRadius: 20.0,
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                icon: Icon(Icons.search, color: Colors.white)),
          ),
        ],
      ),
      body: weather_descriptions == '' ? Center(child: CircularProgressIndicator()) : CityScreen(
        cityName: cityName,
        currentTemp: currentTemp,
        localtime: localtime,
        weather_descriptions: weather_descriptions,
        wind_speed: wind_speed,
        wind_degree: wind_degree,
        pressure: pressure,
        humidity: humidity,
        feelslike: feelslike,
        visibility: visibility,
        cloudiness: cloudiness,
        timeDate: timeDate,
        sea_level: sea_level,
        grnd_level: grnd_level,
        temp_min: temp_min,
        temp_max: temp_max,
        iconIndicator: iconIndicator,
        weatherList: weatherDayList,
      ),
    );
  }
}








