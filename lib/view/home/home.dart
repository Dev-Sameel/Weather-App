import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/services/constants/constans.dart';

import '../../controller/weather_controller.dart';
import '../../model/constants/color.dart';
import '../../model/constants/size.dart';
import '../search/search.dart';
import 'widgets/c_icon_button.dart';
import 'widgets/c_weather_value_text.dart';

class HomeView extends StatelessWidget {
  final WeatherController weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CColors.kBlack,
        body: Obx(() {
          final data = weatherController.weather.value;
          return Column(
            children: [
              ///Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ///Icon Button
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
                      icon: Icons.search,
                      onPressed: () => Get.to(SearchView())),
                ],
              ),
              Image(
                image: AssetImage('assets/images/logo.png'),
                width: 280,
                height: 280,
              ),
              CWeatherValueText(
                label: '',
                value: data.description,
                fontSize: 25,
              ),
              SizedBox(height: CSize.spaceBtwSections),
              weatherController.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : data.description == ''
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Location services are disabled. Please enable location services.',
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  weatherController.fetchCurrentWeather();
                                },
                                child: Text('Retry'),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          height: 220,
                          // color: CColors.kGrey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                        )
            ],
          );
        }),
      ),
    );
  }
}
