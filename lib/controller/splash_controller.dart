import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/view/authentication/login/login.dart';
import 'package:weather/view/home/home.dart';

class SplashController extends GetxController {
  Future<void> checkUserLoggedIn() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userLogged = sharedPrefs.getString('splashKey');
    if (userLogged == 'logOut' || userLogged == null) {
      await Future.delayed(const Duration(seconds: 3));
      Get.offAll(() =>  LoginScreen());
    } else {
      await Future.delayed(const Duration(seconds: 3));
      Get.offAll(() => HomeScreen());
    }
  }

  @override
  void onInit() {
    checkUserLoggedIn();
    super.onInit();
  }
}
