import 'package:flutter/material.dart';

import '../../../../model/constants/color.dart';

class CRoundedImage extends StatelessWidget {
  const CRoundedImage({
    super.key,
    this.right,
    this.left,
    this.image, this.backgroundColor=CColors.kBgcolor,
  });

  final double? right;
  final double? left;
  final String? image;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -35,
      right: right,
      left: left,
      child: Container(
        height: MediaQuery.of(context).size.width / 1.3,
        width: MediaQuery.of(context).size.width / 1.3,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          image: image != null
              ? DecorationImage(
                  image: AssetImage(image!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
      ),
    );
  }
}
