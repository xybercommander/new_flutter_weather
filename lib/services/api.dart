import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:new_weather_app/modules/api_constants.dart';
import 'package:new_weather_app/modules/weather_constants.dart';

class WeatherApi {

  Future<void> callWeatherData(var lat, var lon) async {

    try {

      // TODO: Remove the API KEY from the github repo
      var max_min_url = Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,minutely,alerts,current&appid=${ApiConstants.API_KEY}');
      Response response_max_min = await get(max_min_url);
      var max_min_data = jsonDecode(response_max_min.body);
      WeatherConstants.min_temp = (max_min_data['daily'][0]['temp']['min'] - 273.15).round();
      WeatherConstants.max_temp = (max_min_data['daily'][0]['temp']['max'] - 273.15).round();
      
      var hourly_weather_url = Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=current,daily,minutely,alerts&appid=${ApiConstants.API_KEY}');
      Response response_hourly = await get(hourly_weather_url);
      var hourly_data = jsonDecode(response_hourly.body);
      // print(hourly_data['hourly'][0]['temp']);
      WeatherConstants.current_temp = (hourly_data['hourly'][0]['temp'] - 273.15).round();
      for(int i = 0; i < 12; i++) {                        
        WeatherConstants.hourly_temp.add((hourly_data['hourly'][i]['temp'] - 273.15).round());
        WeatherConstants.hourly_description.add(hourly_data['hourly'][i]['weather'][0]['main']);
      }      


    } catch(e) {
      print(e.toString());
    }

  }

}