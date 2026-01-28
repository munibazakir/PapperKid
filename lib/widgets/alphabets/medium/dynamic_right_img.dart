import 'package:flutter/material.dart';

class DynamicRightImage extends StatelessWidget {
  final double leftWidth;
  final double rightWidth;
  final double rightHeight;
  final String imagePath;

  const DynamicRightImage({
    super.key,
    required this.leftWidth,
    required this.rightWidth,
    required this.rightHeight,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftWidth + 16,
      bottom: 0,
      child: Container(
        width: rightWidth,
        height: rightHeight,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Image.asset(
          imagePath,
          width: rightWidth,
          height: rightHeight,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
