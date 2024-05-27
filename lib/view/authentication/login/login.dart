import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/model/constants/color.dart';
import 'package:weather/model/constants/size.dart';
import 'package:weather/model/constants/text_field.dart';
import 'package:weather/view/authentication/forgot_password/forgot_password.dart';

import '../../../controller/authcontroller/authcontroller.dart';
import 'widgets/c_divider.dart';
import 'widgets/c_footer.dart';
import 'widgets/c_round_image.dart';
import 'widgets/c_textformfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final ctrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header Section
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.width / 1.3,
              child: const Stack(
                children: [
                  CRoundedImage(
                    left: -50,
                  ),
                  CRoundedImage(
                    right: -50,
                    image: 'assets/images/logingWeather.jpg',
                  ),
                ],
              ),
            ),

            ///TextField and Button
            Obx(() {
              return Padding(
                padding: const EdgeInsets.all(CSize.lg * 1.5),
                child: Column(
                  children: [
                    CTextFormField(
                      controller: ctrl.loginemail,
                      border: CTextField.textFieldBorder1,
                      icon: Icons.mail,
                      label: 'Email',
                    ),
                    const SizedBox(
                      height: CSize.spaceBtwItems,
                    ),
                    CTextFormField(
                      controller: ctrl.loginpassword,
                      border: CTextField.textFieldBorder1,
                      icon: Icons.lock,
                      label: 'Password',
                    ),

                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Get.to(() => ForgotPassword());
                            },
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(color: CColors.kOrange),
                            ))),

                    ///Button

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: CColors.kWhite,
                              backgroundColor: CColors.kBgcolor),
                          onPressed: () async {
                            if (ctrl.loginemail.text.isEmpty ||
                                ctrl.loginemail.text.isEmpty) {
                              Get.snackbar('Alert', 'Enter email&password',
                                  backgroundColor: CColors.kWhite);
                            } else {
                              await ctrl.signin();
                            }
                          },
                          child: ctrl.loading.value
                              ? const CircularProgressIndicator()
                              : const Text('SIGN IN')),
                    ),

                    ///Divider
                    const SizedBox(
                      height: CSize.spaceBtwSections,
                    ),

                    const CFormDivider(),
                    const SizedBox(
                      height: CSize.spaceBtwSections,
                    ),

                    ///Google Image
                    const SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Image(
                          image: AssetImage('assets/images/google-icon.png'),
                          width: 35,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: CSize.spaceBtwSections,
                    ),

                    ///Divider
                    const CTextFieldFooter(
                      buttonLabel: 'SIGN UP',
                      textLabel: "Don't have an account?",
                    )
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
