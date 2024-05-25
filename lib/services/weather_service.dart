import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/weather.dart';

class WeatherService {
  final String apiKey = '9447daa2a50fda3595bf109791f07e67'; // Replace with your OpenWeatherMap API key

  Future<Weather> fetchWeatherByCoordinates(double latitude, double longitude) async {
    final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey',
    ));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<Weather> fetchWeatherByCityName(String cityName) async {
    final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$apiKey',
    ));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
