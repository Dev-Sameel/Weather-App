import 'package:get/get.dart';

class PrefControll extends GetxController {
  RxBool isLocationOn = false.obs;

  checkLocation(bool value) async {
    isLocationOn.value = value;
  }
}
