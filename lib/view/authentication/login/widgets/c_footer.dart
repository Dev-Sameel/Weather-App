import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/view/authentication/login/login.dart';
import 'package:weather/view/authentication/signup/signup.dart';

import '../../../../model/constants/color.dart';

class CTextFieldFooter extends StatelessWidget {
  const CTextFieldFooter({
    super.key,
    this.style = const TextStyle(color: CColors.kBlack),
    required this.buttonLabel,
  });
  final TextStyle? style;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          buttonLabel == 'SIGN IN'
              ? "Already have an account?"
              : "Don't have an account?",
          style: style,
        ),
        TextButton(
            onPressed: () {
              buttonLabel == 'SIGN IN'
                  ? Get.to(() => LoginScreen())
                  : Get.to(() => SignupScreen());
            },
            child: Text(
              buttonLabel,
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );
  }
}
