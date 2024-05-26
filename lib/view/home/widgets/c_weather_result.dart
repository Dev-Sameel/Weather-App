import 'package:flutter/material.dart';

import '../../../model/constants/size.dart';
import '../../../model/weather_model.dart';
import 'c_weather_value_text.dart';

class CWeatherResult extends StatelessWidget {
  const CWeatherResult({
    super.key,
    required this.data,
  });

  final Weather data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(CSize.lg),
      height: 220,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 78, 78, 78),
              blurRadius: 17,
              spreadRadius: 1,
              offset: Offset(-5, -5),
            ),
            BoxShadow(
              color: Color.fromARGB(255, 5, 5, 5),
              blurRadius: 15,
              spreadRadius: 1,
              offset: Offset(5, 5),
            ),
          ],
          borderRadius: BorderRadius.circular(CSize.lg),
          color: Color.fromARGB(255, 26, 26, 26)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CWeatherValueText(
                label: 'Temp',
                value: '${data.temperature}°',
              ),
              CWeatherValueText(
                label: 'Pressure',
                value: '${data.pressure}hPa',
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CWeatherValueText(
                label: 'Feels Like',
                value: '${data.feels_like}°',
              ),
              CWeatherValueText(
                label: 'Humidity',
                value: '${data.humidity}%',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
