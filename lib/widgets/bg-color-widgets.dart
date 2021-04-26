import 'dart:ui';

import 'package:flutter/material.dart';

Widget weatherBackground(context, String description) {
  if(description == 'clear sky') {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20, ),
      child: Container(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,      
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(100)
        ),      
      ),
    );
  }
}