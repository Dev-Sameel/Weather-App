import 'dart:developer';

import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather/model/constants/color.dart';
import 'package:weather/model/db/local_storage_model.dart';
import '../model/weather_model.dart';
import '../services/db/local_storage_services.dart';
import '../services/weather_service.dart';

class WeatherController extends GetxController {
  var isLoading = false.obs;
  var weather = Weather(
          description: '',
          temperature: 0.0,
          feelsLike: 0.0,
          pressure: 0,
          humidity: 0,
          name: '')
      .obs;

  Box<LocalStore> weatherBox = Hive.box<LocalStore>('weatherBox');

  final WeatherService weatherService = WeatherService();
  final DBServices dbServices = DBServices();

  @override
  void onInit() {
    super.onInit();
    checkData();
  }

  void checkData() async {
    var localData = weatherBox.get('currentWeather');
    if (localData != null) {
      weather(Weather(
        feelsLike: localData.feelsLike,
        description: localData.description,
        temperature: localData.temp,
        pressure: localData.pressure,
        humidity: localData.humidity,
        name: localData.location,
      ));
    }
  }

  void fetchCurrentWeather() async {
    try {
      isLoading(true);
      Position position = await _determinePosition();
      Weather fetchedWeather = await weatherService.fetchWeatherByCoordinates(
        position.latitude,
        position.longitude,
      );
      weather(fetchedWeather);

      final newDb = LocalStore(
        feelsLike: weather.value.feelsLike,
        description: weather.value.description,
        temp: weather.value.temperature,
        pressure: weather.value.pressure,
        humidity: weather.value.humidity,
        location: weather.value.name,
      );
      await weatherBox.put('currentWeather', newDb);
    } catch (e) {
      log(e.toString());
      if (e == 'Location services are disabled.') {
        await Geolocator.openLocationSettings();
      } else {
        Get.snackbar('Error', e.toString(),
            snackPosition: SnackPosition.TOP, backgroundColor: CColors.kWhite);
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchWeatherByCityName(String cityName) async {
    try {
      isLoading(true);
      Weather fetchedWeather =
          await weatherService.fetchWeatherByCityName(cityName);
      weather(fetchedWeather);
      final newDb = LocalStore(
        feelsLike: weather.value.feelsLike,
        description: weather.value.description,
        temp: weather.value.temperature,
        pressure: weather.value.pressure,
        humidity: weather.value.humidity,
        location: weather.value.name,
      );
      await weatherBox.put('currentWeather', newDb);
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.TOP, backgroundColor: CColors.kWhite);
    } finally {
      isLoading(false);
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
