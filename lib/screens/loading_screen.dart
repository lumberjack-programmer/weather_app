import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_app/models/forecast_data.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/services/networking.dart';
import '../models/city_model.dart';
import '../models/city_number.dart';
import '../services/location.dart';
import '../components/custom_search_delegate.dart';


class LoadingScreen extends StatefulWidget {
  LoadingScreen({this.cityName});

  String? cityName;

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late String cityName = '';
  late num currentTemp;
  late String localtime = '';
  late String weather_descriptions = '';
  late num wind_speed = 0;
  late int wind_degree = 0;
  late int pressure = 0;
  late int humidity = 0;
  late num feelslike = 0;
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

  late List<CityIdModel> cityList = [];

  @override
  void initState() {
    super.initState();

    if (widget.cityName == null) {
      getLocation();
    } else {
      cityName = widget.cityName!;
      getForecastInfoByCountryName(cityName);
    }
    getCitiesFromJson();

  }


  void getCitiesFromJson() async {
    ApiService apiService = ApiService();
    CityModel cityModel = await apiService.fetchAllCitiesFromLocalJson();
    update(cityModel);
  }


  void update(dynamic allCities) {
    for (var str in allCities.data){
      cityList.add(CityIdModel(cityName: str['name'], id: str['id']));
    }
  }

  void getLocation() async {
    await Geolocator.requestPermission();
    Location location = Location();
    await location.getCurrentLocation(LocationAccuracy.low);
    getForecastInfoForLocation(location.latitude, location.longitude);
  }


  void getForecastInfoByCountryName(String name) async {
    await Geolocator.requestPermission();
    ApiService apiService = ApiService();
    ForecastData forecastData = await apiService.fetchForecastInfoByCountry(cityList.where((element) => element.cityName == name).first);

    setState(() {
      _getApiValues(forecastData);
    });
  }

  void getForecastInfoForLocation(double latitude, double longitude) async {
    await Geolocator.requestPermission();
    ApiService apiService = ApiService();
    ForecastData forecastData =  await apiService.fetchForecastInfoForLocation(latitude, longitude);

    print(forecastData);

      setState(() {
        _getApiValues(forecastData);
      });
  }


  void _getApiValues(ForecastData forecastData) {
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
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('CLIMA'),
        leading: GestureDetector(child: Icon(Icons.navigation),
          onTap: () {
          getLocation();
        },),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: IconButton(
                splashRadius: 20.0,
                onPressed: () {
                  if (cityList.isNotEmpty) {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(allCities: cityList),
                    );
                  }
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








