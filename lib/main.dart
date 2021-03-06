import 'package:flutter/material.dart';
import 'package:new_weather_app/screens/homepage.dart';
import 'package:new_weather_app/screens/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(       
        primarySwatch: Colors.blue,
        fontFamily: 'Comfortaa'
      ),
      home: SplashScreen(),
    );
  }
}

