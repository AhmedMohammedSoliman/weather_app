import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/api/CurrentWeather.dart';

class WheatherWidget extends StatelessWidget {
  String name ;
  DateTime date = DateTime.now() ;
  Wind wind ;
  Clouds clouds ;
  Main main ;
  Sys sys ;
   WheatherWidget({required this.name , required this.wind , required this.clouds ,
   required this.main , required this.sys});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white ,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text("${name.toUpperCase()}", style: TextStyle(color: Colors.black ,
          fontSize: 25 )) ,
          SizedBox(height: 10,),
          Text("${date.day} / ${date.month} / ${date.year}"),
          SizedBox(height: 10,),
          Divider(color: Colors.black, thickness: 0.5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("${sys.country}") ,
                  SizedBox(height: 10,),
                  Text("${(main.temp!-273.15).round().toString()}\u2103" , style: TextStyle(color: Colors.black ,
                  fontSize: 30 ),),
                  SizedBox(height: 10,),
                  Text("min ${(main.tempMin!-273.15).round().toString()}\u2103 / max ${(main.tempMax!-273.15).round()
                      .toString()}\u2103"),
                ],
              ),
              Column(
                children: [
                  Image(image : AssetImage("assets/images/image.png") , width:  100 , height:  100,),
                  SizedBox(height: 10,),
                  Text("wind ${wind.speed} m/s", style: TextStyle(color: Colors.black ,
                      fontSize: 15 )),
                ],
              )
            ],
          ),

        ],
      ),
    );
  }
}
