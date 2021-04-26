import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_weather_app/widgets/bg-color-widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> weekday = ['Thursday', 'Friday', 'Saturday', 'Sunday', 'Monday', 'Tuesday', 'Wednesday'];
  List<String> months = [
    'December',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November'    
  ];

  int minute;
  String minuteFormat() {
    if(DateTime.now().minute - 10 < 0) {
      return '0${DateTime.now().minute}';
    } else {
      return '${DateTime.now().minute}';
    }
  }

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        
      });
    });
    super.initState();
  }



  //------------- UI OF THE APP -------------//
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
                  padding: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 3.5,                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${DateTime.now().hour}:${minuteFormat()}, ${weekday[DateTime.now().weekday].substring(0, 3)} ${months[DateTime.now().month].substring(0, 3)} ${DateTime.now().day}',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Kolkata, IN',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      MaterialButton(
                        onPressed: () => print('Search'),
                        child: Icon(Icons.search, color: Colors.white,),
                        color: Colors.black12,
                        elevation: 0,
                        shape: CircleBorder(),
                      )
                    ],
                  ),
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