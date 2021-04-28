import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController cityNameTextEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

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
                var address = await Geocoder.local.findAddressesFromQuery(cityNameTextEditingController.text);
                print(address.first.coordinates);
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,              
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.orange),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Search', style: TextStyle(color: Colors.orange, fontSize: 24),),
                    SizedBox(width: 10,),
                    Icon(Icons.search, color: Colors.orange),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}