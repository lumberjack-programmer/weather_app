import 'package:geolocator/geolocator.dart';

class Location {

  late double _latitude;
  late double _longitude;



  Future<void> getCurrentLocation(LocationAccuracy locationAccuracy) async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: locationAccuracy);
      _latitude = position.latitude;
      _longitude = position.longitude;
    } catch (e) {
      print('Something went wrong$e');
    }
  }

  double get longitude => _longitude;

  double get latitude => _latitude;
}