import 'package:flutter/material.dart';
import 'package:weather_app/api/CurrentWeather.dart';
import 'package:weather_app/api/api_functions.dart';
import 'package:weather_app/home/sportsTabs.dart';
import 'package:weather_app/home/weatherSportsWIDGET.dart';
import 'package:weather_app/home/weatherWidget.dart';
class HomeScreen extends StatefulWidget{

  static const String routeName = "home" ;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCity = "London" ;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
        Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50) , bottomRight: Radius.circular(50))
        ),
        child: Image.asset("assets/images/weather.jpg"),
      ),
      Container(
        margin: EdgeInsets.only(top: 60 , right: 20 , left: 20),
        child: Scaffold(
          backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: (text){
                   selectedCity = text ;
                   setState((){});
                },
                onSubmitted: (text){
                  selectedCity = text ;
                  setState((){});
                  },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(color: Colors.white , width: 2)
                 ),

                  hintText: "search city" ,
                  hintStyle: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold),
                  suffixIcon: Icon(Icons.search , color: Colors.white , size: 25,)
                ),
              ),
              SizedBox(height: 30),
              FutureBuilder<CurrentWeather>(
                  future: ApiFunctions.getCurrentWeather(selectedCity),
                  builder: (context , asynSnapShot) {
                    if (asynSnapShot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                    }else if (asynSnapShot.hasError){
                      return Center(
                        child: Column(
                          children: [
                            Text(asynSnapShot.data?.message ?? "" ),
                            SizedBox(height: 20,),
                            ElevatedButton(
                                onPressed: (){
                                  ApiFunctions.getCurrentWeather(selectedCity);
                                },
                                child: Text("Try again"))
                          ],
                        ),
                      );
                    }else {
                      // data
                      var currentWeatherName = asynSnapShot.data?.name ?? "" ;
                      var currentWeatherSys = asynSnapShot.data?.sys ;
                      var curretWeatherWind = asynSnapShot.data?.wind ;
                      var currentWeatherClouds = asynSnapShot.data?.clouds ;
                      var currentWeatherMain = asynSnapShot.data?.main ;
                      return WheatherWidget(
                          sys: currentWeatherSys!,
                          name: currentWeatherName,
                          wind: curretWeatherWind! ,
                          clouds: currentWeatherClouds!,
                          main: currentWeatherMain!,) ;
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              Text("Imporatant matches at current weather" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold ,
              color: Colors.blue),),
              SizedBox(
                height: 20,
              ),
              SportsTabs(),
            ],
          ),
        )
    ),
      )
      ],),
    );
  }
}
