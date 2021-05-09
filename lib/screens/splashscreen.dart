import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,        
        children: [
          Lottie.asset('assets/animations/lottie_clouds.json', height: 200, width: 200),
          Lottie.asset('assets/animations/lottie-winds.json', height: 200, width: 200),          
        ],
      )
    );
  }
}