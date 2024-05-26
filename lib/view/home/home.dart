import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weather/services/db/local_storage_services.dart';

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
        floatingActionButton: FloatingActionButton(
          backgroundColor: CColors.kTransparent,
          onPressed: () async {
            // var a = await DBServices().getResult();
            // log(a.location.toString());
            await DBServices().clearAllData();
          },
        ),
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

              weatherController.isLoading.value
                  ? const Center(
                      child: Padding(
                      padding: EdgeInsets.all(CSize.md),
                      child: CircularProgressIndicator(
                        color: CColors.kWhite,
                      ),
                    ))
                  : data.description == ''
                      ? Center(
                          child: Container(
                            margin: EdgeInsets.all(CSize.lg),
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: CColors.kGrey),
                              borderRadius: BorderRadius.circular(CSize.lg),
                            ),
                            child: Center(
                              child: const Text(
                                'Hi Sammel \nWelcome to Weather app',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: CColors.kWhite,
                                    fontFamily: 'Righteous'),
                                textAlign: TextAlign.center,
                              ),
                            ),
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
