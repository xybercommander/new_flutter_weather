import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_weather_app/modules/constants.dart';
import 'package:new_weather_app/modules/weather_constants.dart';
import 'package:new_weather_app/searchpage.dart';
import 'package:new_weather_app/widgets/bg-color-widgets.dart';
import 'package:page_transition/page_transition.dart';

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

  int hour;
  String hourFormat() {
    if(DateTime.now().hour - 10 < 0) {
      return '0${DateTime.now().hour}';
    } else {
      return '${DateTime.now().hour}';
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
                            '${hourFormat()}:${minuteFormat()}, ${weekday[DateTime.now().weekday].substring(0, 3)} ${months[DateTime.now().month].substring(0, 3)} ${DateTime.now().day}',
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
                        onPressed: () => Navigator.push(context, PageTransition(
                          child: SearchPage(),
                          type: PageTransitionType.rightToLeftWithFade,
                          duration: Duration(milliseconds: 400)                          
                        )),
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
                  height: MediaQuery.of(context).size.width / 1.2,                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*1*/
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 32),
                        child: Row(                          
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text.rich(
                                TextSpan(
                                  text: '28',
                                  style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold),
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: '℃',
                                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w100),
                                    )
                                  ]
                                )
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 120,
                              padding: EdgeInsets.symmetric(vertical: 22),                              
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('↑ ${WeatherConstants.maxTemp}℃', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                  Text('↓ ${WeatherConstants.minTemp}℃', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      /*2*/
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(16)
                        ),
                      ),
                      /*3*/
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                        child: Text('Clear and Sunny', style: TextStyle(fontSize: 24),),
                      ),
                      /*4*/
                      Expanded(
                        child: ListView.builder(                            
                          scrollDirection: Axis.horizontal,
                          itemCount: 11,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text('27℃', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                  Image.asset(Constants.iconMap['Clear'], height: 40, width: 40,),
                                  Text('11 am', style: TextStyle(fontSize: 15)),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}