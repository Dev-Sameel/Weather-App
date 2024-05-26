import 'dart:developer';

import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/model/constants/color.dart';
import 'package:weather/model/db/local_storage_model.dart';
import '../model/weather_model.dart';

import '../services/db/local_storage_services.dart';
import '../services/weather_service.dart';
import 'preference_controller.dart';

class WeatherController extends GetxController {
  final PrefControll controll = Get.put(PrefControll());
  var isLoading = false.obs;
  var weather = Weather(
          description: '',
          temperature: 0.0,
          feels_like: 0.0,
          pressure: 0,
          humidity: 0,
          name: '')
      .obs;

  final WeatherService weatherService = WeatherService();
  final DBServices dbServices = DBServices();
  Rx<LocalStore> dbBox = LocalStore(
          location: 'empty',
          description: '',
          temp: 0.0,
          feelsLike: 0.0,
          pressure: 0,
          humidity: 0)
      .obs;

  @override
  void onInit() {
    super.onInit();
    fetchDBdata();
    
    checkdata();
    log(dbBox.value.location.toString());
    // fetchCurrentWeather();
  }

  Future<void> fetchDBdata() async {
  await dbServices.openBox();
  dbBox.value = await dbServices.getResult();
}


  checkdata() async {
    dbBox.value.location == 'empty'
        ? fetchCurrentWeather()
        : weather(Weather(
            feels_like: dbBox.value.feelsLike,
            description: dbBox.value.description,
            temperature: dbBox.value.temp,
            pressure: dbBox.value.pressure,
            humidity: dbBox.value.humidity,
            name: dbBox.value.location));
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
      controll.checkLocation(true);
      final newDb = LocalStore(
          feelsLike: weather.value.feels_like,
          description: weather.value.description,
          temp: weather.value.temperature,
          pressure: weather.value.pressure,
          humidity: weather.value.humidity,
          location: weather.value.name);
      log(newDb.location.toString());
      await dbServices.addResult(newDb);
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
          feelsLike: weather.value.feels_like,
          description: weather.value.description,
          temp: weather.value.temperature,
          pressure: weather.value.pressure,
          humidity: weather.value.humidity,
          location: weather.value.name);
      log(newDb.location.toString());
      await dbServices.addResult(newDb);
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
