import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/api/CurrentWeather.dart';

import 'WeatherSports.dart';

class ApiFunctions {
static const String baseURL = "api.openweathermap.org";
static const String baseURL2 = "api.weatherapi.com";
 static Future<CurrentWeather>  getCurrentWeather (String city)async{
     //https://api.openweathermap.org/data/2.5/weather?q=cairo&appid=708004e0ad676f83ddb16382cb19a110
    try{
      var url = Uri.https(baseURL, "/data/2.5/weather" ,  {
        "q" : city ,
        "appid" : "708004e0ad676f83ddb16382cb19a110",
      });
      var response = await http.get(url);
      String body = response.body ;
      var json = jsonDecode(body);
      var currentWeather = CurrentWeather.fromJson(json);
      return currentWeather ;
    }catch(e){
      rethrow ;
    }
  }

  static Future<WeatherSports> getWeatherSports ()async{
   // http://api.weatherapi.com/v1/sports.json?key=35b7d555d4714092a8c233000222512&q=London
    var url = Uri.http(baseURL2, "/v1/sports.json" , {
     "key" : "35b7d555d4714092a8c233000222512" ,
      "q" : "london"
    });
   try{
     var response = await http.get(url);
     var body = response.body ;
     var json = jsonDecode(body);
     print(json);
     var weathersports = WeatherSports.fromJson(json);
     return weathersports ;
   }catch(e){
     print(e);
     rethrow ;
   }

  }
}