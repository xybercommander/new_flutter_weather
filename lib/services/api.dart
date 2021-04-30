import 'dart:convert';

import 'package:http/http.dart';
import 'package:new_weather_app/modules/api_constants.dart';
import 'package:new_weather_app/modules/weather_constants.dart';

class WeatherApi {

  Future<void> callWeatherData(var lat, var lon) async {

    try {

      // TODO: Remove the API KEY from the github repo
      var max_min_url = Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,minutely,alerts,current&appid=${ApiConstants.API_KEY}');
      Response response = await get(max_min_url);
      var data = jsonDecode(response.body);
      WeatherConstants.min_temp = (data['daily'][0]['temp']['min'] - 273.15).round();
      WeatherConstants.max_temp = (data['daily'][0]['temp']['max'] - 273.15).round();
      
      var hourly_weather = Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=current,daily,minutely,alerts&appid=${ApiConstants.API_KEY}');


    } catch(e) {
      print(e.toString());
    }

  }

}