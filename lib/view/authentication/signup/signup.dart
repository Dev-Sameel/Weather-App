import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weather/model/constants/color.dart';
import 'package:weather/model/constants/size.dart';
import 'package:weather/model/constants/text_field.dart';

import '../login/widgets/c_divider.dart';
import '../login/widgets/c_footer.dart';
import '../login/widgets/c_round_image.dart';
import '../login/widgets/c_textformfield.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
              child: Stack(
                children: [
                  CRoundedImage(
                    left: -50,
                  ),
                  CRoundedImage(
                    right: -50,
                    image: 'assets/images/signupWeather.jpg',
                  ),
                  Positioned(
                    top: 55,
                    left: 20,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          CupertinoIcons.back,
                          color: CColors.kWhite,
                          size: 40,
                        )),
                  )
                ],
              ),
            ),

            ///TextField and Button
            Padding(
              padding: const EdgeInsets.all(CSize.lg * 1.5),
              child: Column(
                children: [
                  CTextFormField(
                    border: CTextField.textFieldBorder2,
                    icon: Icons.edit,
                    label: 'Username',
                    style: CTextField.textfieldTextStyle1,
                    iconColor: CColors.kWhite,
                  ),
                  const SizedBox(
                    height: CSize.spaceBtwItems,
                  ),
                  CTextFormField(
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
                    border: CTextField.textFieldBorder2,
                    icon: Icons.password,
                    label: 'Password',
                    style: CTextField.textfieldTextStyle1,
                    iconColor: CColors.kWhite,
                  ),
                  const SizedBox(
                    height: CSize.spaceBtwItems,
                  ),
                  CTextFormField(
                    border: CTextField.textFieldBorder2,
                    icon: Icons.lock,
                    label: 'Confirm Password',
                    style: CTextField.textfieldTextStyle1,
                    iconColor: CColors.kWhite,
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
                        onPressed: () {},
                        child: const Text('SIGN IN')),
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
                    style: CTextField.textfieldTextStyle1,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
