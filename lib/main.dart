import 'package:flutter/material.dart';
import 'package:restapi/splashscreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const SplashScreen(),
    ),
  );
}
