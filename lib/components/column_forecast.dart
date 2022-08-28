import 'package:flutter/material.dart';
class ColumnForecast extends StatelessWidget {
  ColumnForecast({
    required this.weekDayName,
    required this.dayMonth,
    required this.assetImage,
    required this.degrees,
    required this.description,
    required this.minDegrees,
    required this.maxDegrees,
    required this.toggle,
    required this.toggleState});

  final bool toggle;
  final String weekDayName;
  final String dayMonth;
  final String description;
  final AssetImage assetImage;
  final String degrees;
  final String minDegrees;
  final String maxDegrees;
  final VoidCallback toggleState;


  // weekDayName: getDateFormatted(widget.weatherList![i]['dt_txt']),
  // dayMonth: '${widget.weatherList![i]['dt_txt']}',
  // assetImage: AssetImage(WeatherModel.getWeatherImage(widget.weatherList![i]['weather'][0]['main'])),
  // degrees: '${widget.weatherList![i]['main']['temp']}',
  // description: '${widget.weatherList![i]['weather'][0]['description']}',
  // minDegrees: '${(widget.weatherList![i]['main']['temp_min'] - 273.15).toStringAsFixed(0)}',
  // maxDegrees: '${(widget.weatherList![i]['main']['temp'] - 273.15).toStringAsFixed(0)}',
  // toggle: forecastToggle,
  // toggleState: () {


  @override
  Widget build(BuildContext context) {
    List<Widget> forecastLongList = [
      Text(weekDayName),
      SizedBox(height: 10.0,),
      SizedBox(height: 5.0,),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 19.0),
          child: Text(description, style: TextStyle(fontSize: 12.0, color: Color(0xffa29fbc)),)),
      Container(
        margin: EdgeInsets.only(
            bottom: 20.0, top: 20.0, left: 5.0, right: 5.0),
        child: Image(
          width: 70.0,
          image: assetImage,
        ),
      ),
      Text(dayMonth, style: TextStyle(fontSize: 12.0, color: Color(0xffa29fbc))),
      SizedBox(height: 5.0,),
      Text('$minDegrees°'),
      Text('$maxDegrees°'),
    ];


    List<Widget> forecastShortList = [
      Column(
        children: [
          Text(weekDayName),
          SizedBox(height: 5.0,),
          Text('$degrees°',
              style: TextStyle(
              fontSize: 20.0,
              color: Color(0xffa29fbc),
              fontWeight: FontWeight.w500,
              ),),
          Container(
            margin: EdgeInsets.only(
                bottom: 20.0, top: 25.0, left: 5.0, right: 5.0),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Image(
                width: 70.0,
                image: assetImage,
              ),
            ),
          ),
          Text(dayMonth),

        ],
      ),
    ];


    return GestureDetector(
      onTap: toggleState,
      child: Container(
        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40.0),),
          color: Color(0xff48319d),
          border: Border.all(
            color: Color(0xff6343bb),
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
        width: 95.0,
        margin: EdgeInsets.only(left: 18.0, top: 18.0, bottom: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: toggle ? forecastLongList : forecastShortList,
        ),
      ),
    );
  }
}