import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/model/constants/size.dart';
import 'package:weather/view/search/search.dart';

import '../../../controller/preference_controller.dart';
import '../../../controller/weather_controller.dart';
import 'c_icon_button.dart';
import 'c_weather_value_text.dart';

class CWeatherHeader extends StatelessWidget {
  const CWeatherHeader({
    super.key,
    required this.weatherController,
  });

  final WeatherController weatherController;

  @override
  Widget build(BuildContext context) {
    PrefControll controll = Get.put(PrefControll());
    final data = weatherController.weather.value;
    return Obx(() {
      return controll.isLocationOn.value == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CIconButton(
                    icon: Icons.gps_fixed,
                    onPressed: () {
                      weatherController.fetchCurrentWeather();
                    }),
                CWeatherValueText(
                  label: 'Location',
                  value: data.name,
                ),
                CIconButton(
                    icon: Icons.search, onPressed: () => Get.to(SearchView())),
              ],
            )
          : SizedBox(
              height: CSize.spaceBtwSections,
            );
    });
  }
}
