import 'package:flutter/material.dart';

import 'color.dart';
import 'size.dart';

class CTextField {
  static var textFieldBorder1 = OutlineInputBorder(
      borderRadius: BorderRadius.circular(CSize.lg * 2),
      borderSide: const BorderSide(color: CColors.kGrey));

  static var textFieldBorder2 = OutlineInputBorder(
      borderRadius: BorderRadius.circular(CSize.lg * 2),
      borderSide: const BorderSide(color: CColors.kWhite));

  static var textfieldTextStyle1 = TextStyle(color: CColors.kWhite);
}
