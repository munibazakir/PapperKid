import 'package:flutter/material.dart';

class ProgressBox extends StatelessWidget {
  const ProgressBox({
    super.key,
    required this.barWidth,
    required this.activeIndex,
    required this.boxColors,
  });

  final double barWidth;
  final int activeIndex;
  final List<Color> boxColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: barWidth,
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: List.generate(8, (index) {
          return Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.only(right: index == 7 ? 0 : 6),
              decoration: BoxDecoration(
                color: index <= activeIndex
                    ? boxColors[index]
                    : Color(0xFFEFF1F3),
                borderRadius: BorderRadius.circular(4),
                border: Border(
                  right: BorderSide(color: Color(0xFFE8E8E8), width: 2),
                  bottom: BorderSide(color: Color(0xFFE8E8E8), width: 4),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
