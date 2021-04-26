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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          weatherBackground(context, 'clear sky'),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //---------- TOP CONTAINER ----------//
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 3.5,                  
                  child: Text('Top Container'),
                ),

                //---------- BOTTOM CONTAINER ----------//
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 1.1,
                  color: Colors.amberAccent,
                  child: Text('Bottom Container'),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}