import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
