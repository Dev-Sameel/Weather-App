import 'package:flutter/material.dart';

import '../../../model/constants/color.dart';

class CIconButton extends StatelessWidget {
  const CIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: CColors.kGrey), shape: BoxShape.circle),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 30,
            color: CColors.kWhite,
          )),
    );
  }
}
