import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController cityNameTextEditingController = TextEditingController();

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
              controller: cityNameTextEditingController,
              style: TextStyle(color: Colors.grey[800], fontSize: 20),
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                labelText: 'city name',
                labelStyle: TextStyle(fontSize: 18, color: Colors.grey[600]),
                fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),                  
                ),
                focusedBorder:OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[800], width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}