import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:weather/services/constants/constans.dart';
import '../model/weather_model.dart';

class WeatherService {
  Future<Weather> fetchWeatherByCoordinates(
      double latitude, double longitude) async {
    try {
      final response = await http.get(Uri.parse(
        '${CApiHelper.domain}lat=$latitude&lon=$longitude${CApiHelper.endPoint + CApiHelper.apiKey}',
      ));

      if (response.statusCode == 200) {
        return Weather.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception(
          'Failed to load weather data. Please check your network connection.');
    }
  }

  Future<Weather> fetchWeatherByCityName(String cityName) async {
    try {
      final response = await http.get(Uri.parse(
        '${CApiHelper.domain}q=$cityName${CApiHelper.endPoint + CApiHelper.apiKey}',
      ));

      if (response.statusCode == 200) {
        return Weather.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception(
          'Failed to load weather data. Please check your network connection.');
    }
  }
}
