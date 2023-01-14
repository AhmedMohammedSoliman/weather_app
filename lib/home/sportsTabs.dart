import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/home/weatherCricketWidget.dart';
import 'package:weather_app/home/weatherGolfWidget.dart';
import 'package:weather_app/home/weatherSportsWIDGET.dart';

class SportsTabs extends StatefulWidget {

  @override
  State<SportsTabs> createState() => _SportsTabsState();
}

class _SportsTabsState extends State<SportsTabs> {
  int selectedTab = 0;

  List<String> titleList = ["Football", " Cricket", "Golf"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabBar(
                  onTap: (index) {
                    selectedTab = index;
                    setState(() {});
                  },
                  isScrollable: true,
                  tabs: [
                    Text("Football", style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize:
                        18),),
                    Text("Cricket", style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize:
                        18),),
                    Text("Golf", style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize:
                        18),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
                height: 250,
                child: selectedBody(selectedTab)),
          ],
        ));
  }

  Widget selectedBody(int index) {
    if (index == 0){
      return WeatherSportsWidget() ;
    }else if (index == 1){
      return WeatherCricketWidget();
    }else {
      return WeatherGolfWidget();
    }
  }
}




