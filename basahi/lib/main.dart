import 'package:flutter/material.dart';
import 'package:basahi/HomeScreen/homeScreen.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: 'home',
      routes: {
        'home': (context) => HomeScreen(),
      },
    )
  );
}