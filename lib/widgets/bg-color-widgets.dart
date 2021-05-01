import 'dart:ui';
import 'package:flutter/material.dart';

Widget weatherBackground(context, String description) {
  if(description == 'clear sky') {
    return Positioned(      
      left: 70,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 45, sigmaY: 45,),
        child: Image.asset('assets/images/clear_sky_bg.jpg')
      ),
    );
  } else if(description == 'rain') {
    return Positioned(      
      right: 50,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 45, sigmaY: 45,),
        child: Image.asset('assets/images/rain_bg.jpg')
      ),
    );
  } else if(description == 'thunderstorm') {
    return Positioned(      
      right: 0,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 40, sigmaY: 40,),
        child: Image.asset('assets/images/thunderstorm_bg.jpg')
      ),
    );
  } else if(description == 'snow') {
    return Positioned(      
      top: 0,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 35, sigmaY: 35,),
        child: Image.asset('assets/images/snow_bg.jpg')
      ),
    );
  }
}