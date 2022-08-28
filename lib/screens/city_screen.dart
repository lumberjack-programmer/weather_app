import 'package:flutter/material.dart';
import 'package:weather_app/components/chart.dart';
import 'package:weather_app/models/country_info.dart';
import 'package:weather_app/screens/loading_screen.dart';
import '../components/column_forecast.dart';
import '../components/weather_parameter.dart';
import '../services/weather.dart';
import 'package:dart_date/dart_date.dart';
import 'package:intl/intl.dart';
import '../components/chart.dart';




class CityScreen extends StatefulWidget {

  String? cityName;
  num? currentTemp;
  String? localtime;
  String? weather_descriptions;
  double? wind_speed;
  int? wind_degree;
  int? pressure;
  int? humidity;
  double? feelslike;
  int? visibility;
  int? cloudiness;
  String? timeDate;
  int? sea_level;
  int? grnd_level;
  num? temp_min;
  num? temp_max;
  String? iconIndicator;
  List<dynamic>? weatherList;




  CityScreen({
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
      this.iconIndicator,
      this.weatherList,
  });



  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

   late String cityName = '';

  @override
  void initState() {
    super.initState();
  }

   List<TemperatureTimeData> weatherForecastList = [];

  String result = '';
  bool forecastToggle = false;

  String getTimeFormatted(String dateStamp) {
    const timePattern = 'ha';
    final time = DateTime.parse(dateStamp).format(timePattern, 'de_DE');
    return time;
  }


  final Map<String, String> months = {
    'Jan': '01',
    'Feb': '02',
    'Mar': '03',
    'Apr': '04',
    'May': '05',
    'Jun': '06',
    'Jul': '07',
    'Aug': '08',
    'Sep': '09',
    'Oct': '10',
    'Nov': '11',
    'Dec': '12',
  };

  String getDateFormatted(String dateStamp) {
    const dayPattern = 'dd';
    const monthPattern = 'MM';
    final day = DateTime.parse(dateStamp).format(dayPattern, 'de_DE');
    final month = DateTime.parse(dateStamp).format(monthPattern, 'de_DE');
    String dayWithWord = '';
    months.forEach((key, value) {
      if(value.contains(month)) {
        dayWithWord = key;
      }
    });
    return '$day $dayWithWord';
  }

   String getTwelveHourTimeFormatted(String date)  {
     Intl.defaultLocale = 'es';
     return DateFormat.jm().format(DateTime.parse(date)).toString();
   }



//DateFormat.jm();
  @override
  Widget build(BuildContext context) {

    for(int i = 0; i < 10; i++) {
      weatherForecastList.add(TemperatureTimeData(
          time: getTimeFormatted(widget.weatherList![i]['dt_txt']),
          temp: double.parse((widget.weatherList![i]['main']['temp'] - 273.15).toStringAsFixed(0))));
    }



    return Scaffold(
      body: widget.currentTemp == 0.0  ?  Center(child: CircularProgressIndicator()) : Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 1.3,
            stops: [
              0.4, 3.5
            ],
            colors: [
              Color(0xff45278B),
              Color(0xff2E335A),
            ],
          ),
        ),
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      widget.cityName ?? cityName,
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                  Container(
                    child: Text(
                      '${widget.weather_descriptions}',
                      style: TextStyle(fontSize: 23.0, color: Color(0xffa29fbc),),
                    ),
                  ),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(
                        color: Color(0xff56319c),
                        width: 1.8,
                      ),
                    ),
                    color: Color(0x222b2157),
                    margin: EdgeInsets.all(15.0),
                    child: Padding(
                      padding: EdgeInsets.all(30.0,),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Today',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Friday, 26 Aug',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [

                                      Text((widget.currentTemp! - 273.15).toStringAsFixed(0), style: TextStyle(
                                          fontSize: 70.0,
                                          fontWeight: FontWeight.w600),
                                      ),

                                      Baseline(
                                        baseline: 0,
                                        baselineType: TextBaseline.alphabetic,
                                        child: Text('°C', style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffeabe12),
                                        ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text('Feels like ${(widget.feelslike! - 273.15).toStringAsFixed(0)}°C',
                                    style: TextStyle(
                                      color: Color(0xffa29fbc),
                                      fontSize: 15.0,
                                    ),),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 20.0, top: 25.0,),
                                child: Image(
                                  width: 135.0,
                                  image: AssetImage(WeatherModel.getWeatherImage(widget.iconIndicator.toString())),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_pin, size: 30.0,),
                              SizedBox(width: 10.0,),
                              Text(
                                widget.cityName ?? cityName,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                WeatherParameter(
                                  icon: Icons.air,
                                  text: 'Wind',
                                  value: '${widget.wind_speed} km/h',),
                                WeatherParameter(
                                    icon: Icons.water_drop,
                                    text: 'Humidity',
                                    value: '${widget.humidity}%'
                                ),
                                WeatherParameter(
                                    icon: Icons.visibility,
                                    text: 'Visibility',
                                    value: '${widget.visibility}'
                                ),
                                WeatherParameter(
                                    icon: Icons.compare_arrows,
                                    text: 'Pressure',
                                    value: '${widget.pressure}'
                                ),

                                WeatherParameter(
                                    icon: Icons.cloud,
                                    text: 'Cloudiness',
                                    value: '${widget.cloudiness}%'
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //color: Color(0x99452e7d),
                  // color: Color(0xff56319c),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        stops: [
                          0.1, 2.0,
                        ],
                        begin: Alignment(0.0, 0.0),
                        end: Alignment(0.0, 1.0),
                        colors: [
                          Color(0xff45278B),
                          Color(0xff432582),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 10,
                          blurRadius: 20,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [

                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Text(
                            '3 hours / 5 days forecast',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),

                        Divider(thickness: 3.5, color: Color(0xff56319c), height: 25.0,),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              for(int i = 0; i < widget.weatherList!.length; i++)
                              ColumnForecast(
                                weekDayName: getDateFormatted(widget.weatherList![i]['dt_txt']),
                                dayMonth: getTimeFormatted(widget.weatherList![i]['dt_txt']),
                                assetImage: AssetImage(WeatherModel.getWeatherImage(widget.weatherList![i]['weather'][0]['main'])),
                                degrees: (widget.weatherList![i]['main']['temp'] - 273.15).toStringAsFixed(0),
                                description: '${widget.weatherList![i]['weather'][0]['description']}',
                                minDegrees: (widget.weatherList![i]['main']['temp_min'] - 273.15).toStringAsFixed(0),
                                maxDegrees: (widget.weatherList![i]['main']['temp_max'] - 273.15).toStringAsFixed(0),
                                toggle: forecastToggle,
                                toggleState: () {
                                  setState(() {
                                    forecastToggle = !forecastToggle;
                                  });
                                },),

                            ],
                          ),
                        ),


                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Text(
                            '5 days forecast',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),

                        Divider(thickness: 3.5, color: Color(0xff56319c), height: 25.0,),

                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Chart(weatherForecastList: weatherForecastList)),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class CustomSearchDelegate extends SearchDelegate {

  late String cityName = '';
  late double currentTemp = 0.0;
  late String localtime = '';
  late String weather_descriptions = '';
  late double wind_speed = 0;
  late int wind_degree = 0;
  late String wind_dir = '';
  late int pressure = 0;
  late int precip = 0;
  late int humidity = 0;
  late int cloudcover = 0;
  late double feelslike = 0;
  late int uv_index = 0;
  late int visibility = 0;
  late int cloudiness = 0;
  late String is_day = '';

  late String timeDate = '';
  late int sea_level = 0;
  late int grnd_level = 0;
  late double temp_min = 0;
  late double temp_max = 0;
  late String iconIndicator = '';

  late List<dynamic> weatherDayList = [
  ];

  List<CountryInfo> countriesList = [
    CountryInfo(
        id: 1, cityName: 'London', latitude: 0.1276, longitude: 51.5072),
    CountryInfo(
        id: 2, cityName: 'New York', latitude: 74.0060, longitude: 40.7128),
    CountryInfo(
        id: 3, cityName: 'Toronto', latitude: 79.3832, longitude: 43.6532),
    CountryInfo(
        id: 4, cityName: 'Montreal', latitude: 73.5674, longitude: 45.5019),
    CountryInfo(
        id: 6, cityName: 'Sweden', latitude: 18.6435, longitude: 60.1282),
    CountryInfo(id: 7, cityName: 'Paris', latitude: 2.3522, longitude: 48.8566),
    CountryInfo(id: 7, cityName: 'Berlin', latitude: 2.3522, longitude: 48.8566),
    CountryInfo(id: 7, cityName: 'Warsaw', latitude: 2.3522, longitude: 48.8566),
    CountryInfo(id: 7, cityName: 'Oslo', latitude: 2.3522, longitude: 48.8566),
    CountryInfo(id: 7, cityName: 'USA', latitude: 2.3522, longitude: 48.8566),
    CountryInfo(id: 7, cityName: 'Vancouver', latitude: 2.3522, longitude: 48.8566),
  ];


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      // Container(
      //   child: Text(query),
      // ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        splashRadius: 20.0,
        onPressed: () {
          close(context, null);
        }, icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, null);


    return Container();
  }

    late double latitude;
    late double longitude;



  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: countriesList.length,
        prototypeItem: ListTile(
          title: Text(countriesList[3].cityName),
        ),

        itemBuilder: (context, index) {
          final suggestion = countriesList[index];
          return ListTile(
              title: Text(suggestion.cityName),
              onTap: () {
                query = suggestion.cityName;
                print('Quesry: $query');
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            LoadingScreen(cityName: suggestion.cityName)));
              }
          );
        }
    );
  }
  @override
  ThemeData appBarTheme(BuildContext context) {
    var superThemeData = super.appBarTheme(context);
    return superThemeData.copyWith(
      colorScheme: ColorScheme.dark(),
      cardColor: Colors.white,
      canvasColor: Colors.white,

    );
  }
}