import 'package:alphabetsandcounting/utils/image.dart';
import 'package:flutter/material.dart';

class RightImage extends StatelessWidget {
  const RightImage({
    super.key,
    required this.leftWidth,
    required this.rightWidth,
    required this.rightHeight,
  });

  final double leftWidth;
  final double rightWidth;
  final double rightHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftWidth + 16, // gap after left container
      bottom: 0,
      child: Container(
        width: rightWidth,
        height: rightHeight,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Image.asset(
          AppImage.rightImage,
          width: rightWidth,
          height: rightHeight,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
