import 'package:flutter/material.dart';

class ProgressDots extends StatelessWidget {
  /// Number of dots
  final int count;

  /// Colors for each dot
  final List<Color> colors;

  /// Width and height of the container
  final double width;
  final double height;

  /// Top border color and width
  final Color borderColor;
  final double borderWidth;

  /// Background color of container
  final Color backgroundColor;

  const ProgressDots({
    super.key,
    this.count = 6,
    required this.colors,
    this.width = 128,
    this.height = 40,
    this.borderColor = const Color(0xFFCCCCCC),
    this.borderWidth = 4,
    this.backgroundColor = const Color(0xFF2C3E50),
  }) : assert(colors.length == count, "Colors length must match count");

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(9999),
        border: Border(
          top: BorderSide(color: borderColor, width: borderWidth),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          count,
          (i) => Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(color: colors[i], shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }
}
