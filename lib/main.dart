import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:weather/services/db/local_storage_services.dart';
import 'model/db/local_storage_model.dart';
import 'view/home/home.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LocalStoreAdapter());
  await DBServices().openBox();
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
