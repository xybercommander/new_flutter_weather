import 'package:flutter/material.dart';
import 'package:new_weather_app/widgets/bg-color-widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          weatherBackground(context, 'clear sky'),
          Center(child: Text('Hi'),),
        ],
      )
    );
  }
}