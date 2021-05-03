import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:new_weather_app/modules/weather_constants.dart';
import 'package:new_weather_app/services/api.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {
  TextEditingController cityNameTextEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  double animationValue = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 64, horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back),
            ),
            SizedBox(height: 40,),
            TextField(
              focusNode: focusNode,
              controller: cityNameTextEditingController,
              style: TextStyle(color: Colors.grey[800], fontSize: 20),
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                labelText: 'city name',
                labelStyle: TextStyle(fontSize: 18, color: focusNode.hasFocus ? Colors.orange : Colors.grey[600]),
                fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),                  
                ),
                focusedBorder:OutlineInputBorder(                  
                  borderSide: BorderSide(color: Colors.orange, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () async {
                setState(() {
                  animationValue = 135;
                });

                FocusScope.of(context).unfocus(); // Unfocuses the keyboard
                var address = await Geocoder.local.findAddressesFromQuery(cityNameTextEditingController.text);
                // print(address.first.coordinates);
                WeatherConstants.cityName = '${cityNameTextEditingController.text[0].toUpperCase()}${cityNameTextEditingController.text.substring(1)}, ${address.first.countryCode}';
                await WeatherApi().callWeatherData(address.first.coordinates.latitude, address.first.coordinates.longitude);                
                Timer(Duration(seconds: 1), () {
                  Navigator.pop(context);
                });
              },
              child: TweenAnimationBuilder(
                duration: Duration(milliseconds: 200),
                tween: Tween<double>(begin: 0, end: animationValue),
                builder: (context, value, child) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: value),
                    child: child,
                  );
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,              
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.orange),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Search', style: TextStyle(color: Colors.orange, fontSize: animationValue != 0 ? 0 : 24),),
                          SizedBox(width: 10,),
                          Icon(Icons.search, color: Colors.orange, size: animationValue != 0 ? 0 : 30,),
                        ],
                      ),
                      Opacity(
                        opacity: animationValue != 0 ? 1 : 0,
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.orange,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}