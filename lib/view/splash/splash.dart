
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/model/constants/color.dart';

import '../../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
 
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: CColors.kBgcolor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/animations/splash.json'),
              const Text(
                'Weather App',
                style: TextStyle(
                    color: CColors.kWhite, fontFamily: 'Righteous', fontSize: 20),
              )
            ],
          ),
        );
      }
    );
  }
}
