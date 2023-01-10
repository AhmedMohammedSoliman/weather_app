import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/CurrentWeather.dart';

class WeatherListWidget extends StatelessWidget {

  String desc ;
  String name ;
  Main main ;

  WeatherListWidget({required this.name , required this.desc , required this.main});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white ,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Text("$name"),
          SizedBox(height: 10,),
          Text("${(main.temp!-273.15).round().toString()}\u2103"),
          SizedBox(height: 10,),
          Image(image: AssetImage("assets/images/image.png") , width: 80 , height: 80,) ,
          SizedBox(height: 10,),
          Text("$desc"),
        ],
      )
    );
  }
}
