import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/controller/preference_controller.dart';

import '../../controller/weather_controller.dart';
import '../../model/constants/color.dart';
import '../../model/constants/size.dart';

import 'widgets/c_weather_header.dart';
import 'widgets/c_weather_result.dart';
import 'widgets/c_weather_value_text.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = Get.put(WeatherController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: CColors.kBlack,
        body: Obx(() {
          final data = weatherController.weather.value;
          return Column(
            children: [
              ///Header
              CWeatherHeader(
                weatherController: weatherController,
              ),
              const Image(
                image: AssetImage('assets/images/logo.png'),
                width: 280,
                height: 280,
              ),
              CWeatherValueText(
                label: '',
                value: data.description,
                fontSize: 25,
              ),
              const SizedBox(height: CSize.spaceBtwSections),
              weatherController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : data.description == ''
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Location services are disabled. Please enable location services.',
                                style: TextStyle(
                                    fontSize: 18, color: CColors.kWhite),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: CColors.kGrey,
                                    foregroundColor: CColors.kWhite),
                                onPressed: () {
                                  weatherController.fetchCurrentWeather();
                                },
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        )
                      :

                      ///Weather Result
                      CWeatherResult(data: data)
            ],
          );
        }),
      ),
    );
  }
}
