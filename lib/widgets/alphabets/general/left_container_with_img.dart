import 'package:flutter/material.dart';

class LeftContainerWithImg extends StatelessWidget {
  const LeftContainerWithImg({
    super.key,
    required this.leftWidth,
    required this.leftHeight,
    required this.leftImage,
  });

  final double leftWidth;
  final double leftHeight;
  final String leftImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: leftWidth,
      height: leftHeight,
      decoration: BoxDecoration(
        color: const Color(0xFFE63946),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Image.asset(
          leftImage,
          width: leftWidth * 0.75,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
