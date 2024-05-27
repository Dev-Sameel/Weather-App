import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/constants/color.dart';

class CBackArrowButton extends StatelessWidget {
  const CBackArrowButton({
    super.key,
    this.color = CColors.kWhite,
  });
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 55,
      left: 20,
      child: IconButton(
          onPressed: () {
            log('ff');
            Get.back();
          },
          icon: Icon(
            CupertinoIcons.back,
            color: color,
            size: 40,
          )),
    );
  }
}
