import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/controller/authcontroller/authcontroller.dart';
import 'package:weather/services/db/local_storage_services.dart';

import 'package:weather/view/authentication/login/login.dart';

import '../../controller/weather_controller.dart';
import '../../model/constants/color.dart';
import '../../model/constants/size.dart';

import 'widgets/c_weather_header.dart';
import 'widgets/c_weather_result.dart';
import 'widgets/c_weather_value_text.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;
  final ctrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = Get.put(WeatherController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(size: 30, color: CColors.kWhite),
        backgroundColor: const Color.fromRGBO(74, 140, 136, 1),
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: CSize.md),
              onPressed: () async {
                await ctrl.signout();
                await DBServices().clearAllData();
                Get.offAll(() => LoginScreen());
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      backgroundColor: CColors.kBlack,
      body: Obx(() {
        final data = weatherController.weather.value;
        return SingleChildScrollView(
          child: Column(
            children: [
              auth.currentUser!.emailVerified
                  ? SizedBox()
                  : Text('${auth.currentUser!.email!} not verifyed'),
              const SizedBox(
                height: CSize.spaceBtwSections,
              ),

              ///Header
              CWeatherHeader(
                weatherController: weatherController,
              ),
              Lottie.asset('assets/animations/weatherLotti.json'),

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
                            margin: const EdgeInsets.all(CSize.lg),
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromRGBO(218, 200, 176, 1)),
                              borderRadius: BorderRadius.circular(CSize.lg),
                            ),
                            child: const Center(
                              child: Text(
                                'Welcome to Weather app',
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
          ),
        );
      }),
    );
  }
}
