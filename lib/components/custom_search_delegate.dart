import 'package:flutter/material.dart';
import 'package:weather_app/services/networking.dart';
import '../models/city_number.dart';
import '../models/country_info.dart';
import '../screens/loading_screen.dart';
import '../models/city_model.dart';
class CustomSearchDelegate extends SearchDelegate {

  late List<CityIdModel> allCities;


  CustomSearchDelegate({required this.allCities});

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

  // void getAllCities() async {
  //   ApiService apiService = ApiService();
  //   CityModel allCities = await apiService.fetchAllCitiesNames();
  //   print(allCities.data);
  // }





  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        query = '';
      },
    ),
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
    return Container();
  }





  @override
  Widget buildSuggestions(BuildContext context)  {


    final results =  allCities.where((element) =>
        element.cityName.toLowerCase().contains(query.toLowerCase())).toSet().toList();

    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final suggestion = results[index].cityName;
          return ListTile(
              title: Text(results[index].cityName),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            LoadingScreen(cityName: suggestion)));
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