import 'package:flutter/material.dart';
import 'package:weather_app/screens/loading_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
         // scaffoldBackgroundColor: Color(0xff45278B),
      ),
      home: LoadingScreen(),
    );
  }
}