import 'package:flutter/material.dart';

class WeatherParameter extends StatelessWidget {
  WeatherParameter({required this.icon, required this.text, required this.value});

  final IconData icon;
  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95.0,
      margin: EdgeInsets.only(top: 20.0, left: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25.0,),),
        border: Border.all(
          color: Color(0xff9177d9),
        ),
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
      child: Column(
        children: [
          Icon(icon),
          Text(text),
          Text(value),
        ],
      ),
    );
  }
}