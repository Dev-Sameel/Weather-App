import 'package:flutter/material.dart';

import '../../../../model/constants/color.dart';
import '../../../../model/constants/text_field.dart';

class CTextFormField extends StatelessWidget {
  const CTextFormField({
    super.key,
    this.style = const TextStyle(color: CColors.kBlack),
    this.contentPadding = const EdgeInsets.all(15),
    required this.icon,
    this.iconColor = CColors.kBlack,
    required this.label,
    required this.border, this.controller,
  });
  final TextEditingController? controller;
  final TextStyle? style;
  final EdgeInsets? contentPadding;
  final IconData icon;
  final Color? iconColor;
  final String label;
  final OutlineInputBorder border;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
        style: style,
        decoration: InputDecoration(
          contentPadding: contentPadding,
          prefixIcon: Icon(
            icon,
            color: iconColor,
          ),
          label: Text(label),
          labelStyle: style,
          focusedBorder: border,
          enabledBorder: border,
        ));
  }
}
