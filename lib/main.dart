import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/screens/loading_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
            color: Color(0x222E335A)
        ),
        scaffoldBackgroundColor: Color(0xff45278B),
      ),
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}