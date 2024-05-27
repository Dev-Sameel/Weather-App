import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/model/constants/color.dart';

import '../../../controller/authcontroller/authcontroller.dart';
import '../../../services/db/local_storage_services.dart';
import '../../authentication/login/login.dart';

signoutDialod() {
  final ctrl = Get.put(AuthController());

  return Get.dialog(AlertDialog(
    title: const Text('Sign Out'),
    content: const Text('Are you sure?'),
    actions: [
      TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
                color: CColors.kBlack,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )),
      TextButton(
          onPressed: () async {
            await ctrl.signout();
            await DBServices().clearAllData();
            Get.offAll(() => LoginScreen());
          },
          child: const Text('Confirm',
              style: TextStyle(
                  color: CColors.kBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)))
    ],
  ));
}
