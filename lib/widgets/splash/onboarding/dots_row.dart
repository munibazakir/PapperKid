import 'package:flutter/material.dart';

class DotsRow extends StatelessWidget {
  final int index;
  const DotsRow({super.key, required this.index});

  /// EVERY SCREEN COLOR
  Color _activeColor(int index) {
    switch (index) {
      case 0:
        return Color(0xFFFF6B6B);
      case 1:
        return Color(0xFF457B9D);
      case 2:
        return Color(0xFFFF6B6B);
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (i) {
        final bool isActive = index == i;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 32 : 12,
          height: 12,
          decoration: BoxDecoration(
            color: isActive ? _activeColor(index) : Color(0xFFD1D5DB),
            borderRadius: BorderRadius.circular(9999),
          ),
        );
      }),
    );
  }
}
