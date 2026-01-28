import 'package:flutter/material.dart';

class ProgressPersentage extends StatelessWidget {
  const ProgressPersentage({
    super.key,
    required this.activeIndex,
    required this.progress,
  });

  final int activeIndex;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Text(
      activeIndex < 0
          ? "0.0% Complete"
          : "${progress.toStringAsFixed(1)}% Complete",
      style: TextStyle(
        fontFamily: 'SplineSans',
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Color(0xFF6B7280),
      ),
    );
  }
}
