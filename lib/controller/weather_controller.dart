import 'dart:developer';

import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import '../model/weather.dart';

import '../services/weather_service.dart';

class WeatherController extends GetxController {
  var isLoading = true.obs;
  var weather = Weather(
          description: '', temperature: 0.0, feels_like: 0.0,pressure: 0, humidity: 0, name: '')
      .obs;

  final WeatherService weatherService = WeatherService();

  @override
  void onInit() {
    super.onInit();
    fetchCurrentWeather();
  }

  void fetchCurrentWeather() async {
    try {
      isLoading(true);
      Position position = await _determinePosition();
      Weather fetchedWeather = await weatherService.fetchWeatherByCoordinates(
        position.latitude,
        position.longitude,
      );
      log(position.latitude.toString());
      log(position.longitude.toString());
      weather(fetchedWeather);
    } catch (e) {
      print(e);
      if (e == 'Location services are disabled.') {
        bool opened = await Geolocator.openLocationSettings();
        if (opened) {
          Get.snackbar('Info', 'Please enable location services and try again.',
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        Get.snackbar('Error', e.toString(),
            snackPosition: SnackPosition.BOTTOM);
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
