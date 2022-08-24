import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/apittest/weather_data.dart';
import 'package:weather_app/services/networking.dart';
import '../services/location.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RaisedButton(
              onPressed: () {
                //Get the current location
              },
              child: Text('Get Location'),
            ),
          ),

          Center(
              child: Text(result),
            ),
        ],
      ),
    );
  }
}
