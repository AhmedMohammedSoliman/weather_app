import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/home/footBallWidget.dart';
import '../api/WeatherSports.dart';
import '../api/api_functions.dart';

class WeatherGolfWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherSports>(
        future: ApiFunctions.getWeatherSports(),
        builder: (context , asyncSnapShot){
          if (asyncSnapShot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if (asyncSnapShot.hasError){
            return Column(
              children: [
                Text(asyncSnapShot.data?.message ?? "" , style:  TextStyle(color: Colors.red),),
                SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: (){
                      ApiFunctions.getWeatherSports();
                    },
                    child: Text("Try again"))
              ],
            );
          }else {
            // data
            var weatherGolfList = asyncSnapShot.data?.golf ?? [];
            return Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context , index) => SizedBox(width: 15,),
                  itemCount: weatherGolfList.length ,
                  itemBuilder: (context , index) => Container(
                    decoration: BoxDecoration(
                      color: Colors.white ,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: FootBallWidget(
                      statium: weatherGolfList[index].stadium ?? "",
                      match: weatherGolfList[index].match ?? "",
                      country: weatherGolfList[index].country ?? "",
                      start: weatherGolfList[index].start ?? "" ,
                      image: "assets/images/golf.jpg",),
                  )
              ),
            );
          }
        });
  }
}