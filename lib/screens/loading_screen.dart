import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:weather_app/models/forecast_data.dart';
import 'package:weather_app/components/chart.dart';
import 'package:weather_app/services/networking.dart';
import '../services/location.dart';
import '../components/weather_parameter.dart';
import '../components/column_forecast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {




  @override
  void initState() {
    super.initState();
    getLocation();
  }

  // late String cityName = '';

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



  late String cityName = 'New York';
  // late int currentTemp = 32;
  // late String localtime = '2022-08-25 17:28';
  // late String weather_descriptions = 'Partly cloudy';
  // late int wind_speed = 22;
  // late int wind_degree = 160;
  // late String wind_dir = 'SSE';
  // late int pressure = 1015;
  // late int precip = 0;
  // late int humidity = 33;
  // late int cloudcover = 75;
  // late int feelslike = 33;
  // late int uv_index = 8;
  // late int visibility = 16;
  // late String is_day = 'yes';


  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation(LocationAccuracy.low);
    ApiService apiService = ApiService();
    // WeatherData weatherInfoForCity = await apiService.fetchCityLocation();

    setState(() {
      // cityName = weatherInfoForCity.location['name'];
      // currentTemp = weatherInfoForCity.current['temperature'];
      // localtime = weatherInfoForCity.location['localtime'];
      // weather_descriptions = weatherInfoForCity.current['weather_descriptions'][0];
      // wind_speed = weatherInfoForCity.current['wind_speed'];
      // wind_degree = weatherInfoForCity.current['wind_degree'];
      // wind_dir = weatherInfoForCity.current['wind_dir'];
      // pressure = weatherInfoForCity.current['pressure'];
      // precip = weatherInfoForCity.current['precip'];
      // humidity = weatherInfoForCity.current['humidity'];
      // cloudcover = weatherInfoForCity.current['cloudcover'];
      // feelslike = weatherInfoForCity.current['feelslike'];
      // uv_index = weatherInfoForCity.current['uv_index'];
      // visibility = weatherInfoForCity.current['visibility'];
      // is_day = weatherInfoForCity.current['is_day'];
    });

    getForecastInfoForLocation(location, apiService);
    // print(weatherInfoForCity.location['name']);
    // print(weatherInfoForCity.location['localtime']);
    // print(weatherInfoForCity.current['temperature']);
    // print(weatherInfoForCity.current['weather_descriptions']);
    // print(weatherInfoForCity.current['wind_speed']);
    // print(weatherInfoForCity.current['wind_degree']);
    // print(weatherInfoForCity.current['wind_dir']);
    // print(weatherInfoForCity.current['pressure']);
    // print(weatherInfoForCity.current['precip']);
    // print(weatherInfoForCity.current['humidity']);
    // print(weatherInfoForCity.current['cloudcover']);
    // print(weatherInfoForCity.current['feelslike']);
    // print(weatherInfoForCity.current['uv_index']);
    // print(weatherInfoForCity.current['visibility']);
    // print(weatherInfoForCity.current['is_day']);
    print('Latitude: ${location.latitude}');
    print('Longitute: ${location.longitude}');
  }

  void getForecastInfoForLocation(Location location, ApiService apiService) async {
    ForecastData forecastData =  await apiService.fetchForecastInfoForLocation(location.latitude, location.longitude);

    print(forecastData.list[0]['main']['temp']);



    setState(() {

      currentTemp = forecastData.list[0]['main']['temp'];
      localtime = forecastData.list[0]['dt_txt'];
      currentTemp = forecastData.list[0]['main']['temp'];
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
      // temp_max = forecastData.list[0]['main']['temp_max'];
    });











  }

  String result = '';
  bool forecastToggle = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CLIMA'),
        leading: Icon(FontAwesomeIcons.solidChartBar,),
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
      body: cityName == '' || currentTemp == 0.0 ?  Center(child: CircularProgressIndicator()) : Container(
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
                      cityName,
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                  Container(
                    child: Text(
                      weather_descriptions,
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
                                'Sat, 22 Aug',
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

                                   Text((currentTemp - 273.15).toStringAsFixed(0).toString(), style: TextStyle(
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
                                 Text('Feels like ${(feelslike - 273.15).toStringAsFixed(0).toString()}°C',
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
                                  image: AssetImage('images/sun/26.png'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_pin, size: 30.0,),
                              SizedBox(width: 10.0,),
                              Text(
                                cityName,
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
                                  value: '$wind_speed km/h',),
                                WeatherParameter(
                                  icon: Icons.water_drop,
                                  text: 'Humidity',
                                  value: '$humidity%'
                                ),
                                WeatherParameter(
                                    icon: Icons.visibility,
                                    text: 'Visibility',
                                    value: '$visibility'
                                ),
                                WeatherParameter(
                                    icon: Icons.compare_arrows,
                                    text: 'Pressure',
                                    value: '$pressure'
                                ),

                                WeatherParameter(
                                    icon: Icons.cloud,
                                    text: 'Cloudiness',
                                    value: '$cloudiness%'
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
                            '5 days forecast',
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

                              ColumnForecast(
                                  weekDayName: 'Today',
                                  dayMonth: '22 Aug',
                                  assetImage: AssetImage('images/sun_cloud_angled_rain.png'),
                                  degrees: '19',
                                  description: 'mostly clear',
                                  minDegrees: '16',
                                  maxDegrees: '26',
                                  toggle: forecastToggle,
                                  toggleState: () {
                                    setState(() {
                                      forecastToggle = !forecastToggle;
                                    });
                                  },),

                              ColumnForecast(
                                weekDayName: 'Tomorrow',
                                dayMonth: '22 Aug',
                                assetImage: AssetImage('images/sun_cloud_angled_rain.png'),
                                degrees: '19',
                                description: 'mostly clear',
                                minDegrees: '16',
                                maxDegrees: '26',
                                toggle: forecastToggle,
                                toggleState: () {
                                  setState(() {
                                    forecastToggle = !forecastToggle;
                                  });
                                },),

                              ColumnForecast(
                                weekDayName: 'Today',
                                dayMonth: '22 Aug',
                                assetImage: AssetImage('images/sun_cloud_angled_rain.png'),
                                degrees: '19',
                                description: 'mostly clear',
                                minDegrees: '16',
                                maxDegrees: '26',
                                toggle: forecastToggle,
                                toggleState: () {
                                  setState(() {
                                    forecastToggle = !forecastToggle;
                                  });
                                },),

                              ColumnForecast(
                                weekDayName: 'Today',
                                dayMonth: '22 Aug',
                                assetImage: AssetImage('images/sun_cloud_angled_rain.png'),
                                degrees: '19',
                                description: 'mostly clear',
                                minDegrees: '16',
                                maxDegrees: '26',
                                toggle: forecastToggle,
                                toggleState: () {
                                  setState(() {
                                    forecastToggle = !forecastToggle;
                                  });
                                },),

                              ColumnForecast(
                                weekDayName: 'Today',
                                dayMonth: '22 Aug',
                                assetImage: AssetImage('images/sun_cloud_angled_rain.png'),
                                degrees: '19',
                                description: 'mostly clear',
                                minDegrees: '16',
                                maxDegrees: '26',
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
                            height: 400,
                            child: Chart()),

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
    return Container(
      child: Text(query),
    );
  }




  @override
  Widget buildSuggestions(BuildContext context) {

    List<String> countries = [
      'London',
      'New York',
      'Torronto',
      'Montreal',
      'USA',
    ];

    return ListView.builder(
        itemCount: countries.length,
        prototypeItem: ListTile(
          title: Text(countries.first),
        ),
        itemBuilder: (context, index) {
          final suggestion = countries[index];
          return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;
              close(context, null);
            },
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



