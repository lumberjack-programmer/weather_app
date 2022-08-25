import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/apittest/weather_data.dart';
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


  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation(LocationAccuracy.low);

    ApiTest apiTest = ApiTest();
    WeatherData album = await apiTest.fetchAlbum();

    print(album.location['name']);


    print('Latitude: ${location.latitude}');
    print('Longitute: ${location.longitude}');
  }


  String result = '';

  bool forecastToggle = false;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CLIMA'),
        leading: Icon(FontAwesomeIcons.solidChartBar),
      ),
      body: Container(
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
                      'Montreal',
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Mostly Clear',
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
                                   children: const [
                                     Text('19', style: TextStyle(
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

                                 Text('Feels like 16°C',
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
                                  image: AssetImage('images/sun_cloud_angled_rain.png'),
                                ),
                              ),


                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.location_pin, size: 30.0,),
                              SizedBox(width: 10.0,),
                              Text(
                                'Monreal',
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
                                  value: '15 km/h',),



                                WeatherParameter(
                                  icon: Icons.water_drop,
                                  text: 'Humidity',
                                  value: '90%'
                                ),



                                WeatherParameter(
                                    icon: Icons.visibility,
                                    text: 'Visibility',
                                    value: '10000'
                                ),


                                WeatherParameter(
                                    icon: Icons.compare_arrows,
                                    text: 'Pressure',
                                    value: '1000'
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







