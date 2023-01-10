import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/api/CurrentWeather.dart';

class ApiFunctions {
static const String baseURL = "api.openweathermap.org";
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

}