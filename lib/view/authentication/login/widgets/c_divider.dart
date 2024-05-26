import 'package:flutter/material.dart';
import 'package:weather/model/constants/color.dart';

class CFormDivider extends StatelessWidget {
  const CFormDivider({
    super.key,
    this.style = const TextStyle(color: CColors.kBlack),
  });

  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(
          child: Divider(
            color: CColors.kGrey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          'Or',
          style: style,
        ),
        const Flexible(
          child: Divider(
            color: CColors.kGrey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
