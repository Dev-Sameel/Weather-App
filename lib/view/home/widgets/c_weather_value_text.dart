import 'package:flutter/material.dart';

import '../../../model/constants/color.dart';

class CWeatherValueText extends StatelessWidget {
  const CWeatherValueText({
    super.key,
    this.label,
    this.value,
    this.fontSize = 30,
  });

  final String? label;
  final dynamic value;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        label != ''
            ? Text(
                '$label',
                style: TextStyle(
                    fontSize: 15,
                    color: CColors.kWhite.withOpacity(0.6),
                    fontFamily: 'Righteous'),
              )
            : const SizedBox(),
        Text(
          '$value',
          style: TextStyle(
              fontSize: fontSize,
              color: CColors.kWhite,
              fontWeight: FontWeight.bold,
              fontFamily: 'Righteous'),
        ),
      ],
    );
  }
}
