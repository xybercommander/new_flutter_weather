import 'package:flutter/material.dart';

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
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Text('data')
            ],
          ),
        ),
        tween: Tween<double>(begin: 0, end: 100),
        duration: Duration(seconds: 1),
        builder: (context, double _value, Widget child) {
          return Padding(
            padding: EdgeInsets.only(top: _value),
            child: child,
          );
        },
      )
    );
  }
}