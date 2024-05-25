import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/services/constants/constans.dart';

import '../model/weather.dart';

class WeatherService {
  Future<Weather> fetchWeatherByCoordinates(
      double latitude, double longitude) async {
    final response = await http.get(Uri.parse(
      '${CApiHelper.domain}lat=$latitude&lon=$longitude${CApiHelper.endPoint + CApiHelper.apiKey}',
    ));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<Weather> fetchWeatherByCityName(String cityName) async {
    final response = await http.get(Uri.parse(
      '${CApiHelper.domain}q=$cityName${CApiHelper.endPoint + CApiHelper.apiKey}',
    ));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
