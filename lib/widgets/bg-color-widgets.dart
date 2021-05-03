import 'dart:ui';
import 'package:flutter/material.dart';

// ignore: missing_return
Widget weatherBackground(context, String description) {
  if(description == 'Clear') {
    return Positioned(      
      left: 70,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 45, sigmaY: 45,),
        child: Image.asset('assets/images/clear_sky_bg.jpg')
      ),
    );
  } else if(description == 'Rain' || description == 'Tornado' || description == 'Squall' || description == 'Drizzle') {
    return Positioned(      
      right: 50,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 45, sigmaY: 45,),
        child: Image.asset('assets/images/rain_bg.jpg')
      ),
    );
  } else if(description == 'Thunderstorm' || description == 'Haze' || description == 'Mist' || description == 'Fog' || description == 'Ash' || description == 'Clouds') {
    return Positioned(      
      right: 0,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 40, sigmaY: 40,),
        child: Image.asset('assets/images/thunderstorm_bg.jpg')
      ),
    );
  } else if(description == 'Snow' || description == 'Mist' || description == 'Smoke') {
    return Positioned(      
      top: 0,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 35, sigmaY: 35,),
        child: Image.asset('assets/images/snow_bg.jpg')
      ),
    );
  }
}