import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/controller/authcontroller/authcontroller.dart';
import 'package:weather/model/constants/color.dart';
import 'package:weather/model/constants/size.dart';
import 'package:weather/model/constants/text_field.dart';

import '../login/widgets/c_back_arrow_button.dart';
import '../login/widgets/c_divider.dart';
import '../login/widgets/c_footer.dart';
import '../login/widgets/c_round_image.dart';
import '../login/widgets/c_textformfield.dart';

class SignupScreen extends StatelessWidget {
  final ctrl = Get.put(AuthController());
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.kBgcolor,
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
                    image: 'assets/images/signupWeather.jpg',
                  ),
                  CBackArrowButton()
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
                      controller: ctrl.username,
                      border: CTextField.textFieldBorder2,
                      icon: Icons.person,
                      label: 'Username',
                      style: CTextField.textfieldTextStyle1,
                      iconColor: CColors.kWhite,
                    ),
                    const SizedBox(
                      height: CSize.spaceBtwItems,
                    ),
                    CTextFormField(
                      controller: ctrl.email,
                      border: CTextField.textFieldBorder2,
                      icon: Icons.mail,
                      label: 'Email',
                      style: CTextField.textfieldTextStyle1,
                      iconColor: CColors.kWhite,
                    ),
                    const SizedBox(
                      height: CSize.spaceBtwItems,
                    ),
                    CTextFormField(
                      controller: ctrl.password,
                      border: CTextField.textFieldBorder2,
                      icon: Icons.lock,
                      label: 'Password',
                      style: CTextField.textfieldTextStyle1,
                      iconColor: CColors.kWhite,
                    ),
                    const SizedBox(
                      height: CSize.spaceBtwItems,
                    ),

                    ///Button
                    const SizedBox(
                      height: CSize.spaceBtwSections,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: CColors.kBgcolor,
                              backgroundColor: CColors.kWhite),
                          onPressed: () async {
                            if (ctrl.username.text.isEmpty ||
                                ctrl.password.text.isEmpty ||
                                ctrl.email.text.isEmpty) {
                              Get.snackbar('Alert', 'Required all data',
                                  backgroundColor: CColors.kWhite);
                            } else {
                              await ctrl.signUp();
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

                    CFormDivider(
                      style: CTextField.textfieldTextStyle1,
                    ),
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

                    ///Footer
                    CTextFieldFooter(
                      buttonLabel: 'SIGN IN',
                      textLabel: 'Already have an account?',
                      style: CTextField.textfieldTextStyle1,
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


