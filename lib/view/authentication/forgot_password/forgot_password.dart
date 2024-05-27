import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/model/constants/color.dart';
import 'package:weather/model/constants/size.dart';
import 'package:weather/model/constants/text_field.dart';
import 'package:weather/view/authentication/login/widgets/c_footer.dart';
import 'package:weather/view/authentication/login/widgets/c_textformfield.dart';

import '../../../controller/authcontroller/authcontroller.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final ctrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(CSize.lg),
            child: Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animations/forgot_password.json',
                      width: 300),
                  Text(
                    'Forgot password?',
                    style: TextStyle(
                        fontSize: CSize.md * 1.8,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Righteous'),
                  ),
                  Text(
                    "Don't worry, happens to the best of us.\nType your email to reset your password",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: CSize.md),
                  ),
                  SizedBox(
                    height: CSize.spaceBtwSections,
                  ),
                  CTextFormField(
                      controller: ctrl.restemail,
                      icon: Icons.email,
                      label: 'Email',
                      border: CTextField.textFieldBorder1),
                  SizedBox(
                    height: CSize.spaceBtwItems,
                  ),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: CColors.kWhite,
                            backgroundColor: CColors.kBgcolor),
                        onPressed: () async {
                          if (ctrl.restemail.text.isEmpty) {
                            Get.snackbar('Alert', 'Enter email',
                                backgroundColor: CColors.kWhite);
                          } else {
                            await ctrl.resetPassword();
                          }
                        },
                        icon: Icon(Icons.send),
                        label: ctrl.loading.value
                            ? CircularProgressIndicator()
                            : Text('Send')),
                  ),
                  SizedBox(
                    height: CSize.spaceBtwSections * 2,
                  ),
                  CTextFieldFooter(
                    buttonLabel: 'SIGN IN',
                    textLabel: 'Remember password?',
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
