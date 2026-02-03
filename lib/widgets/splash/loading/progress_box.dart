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
      child: LayoutBuilder(
        builder: (context, constraints) {
          const int totalBoxes = 8;
          const double spacing = 6;

          final double totalSpacing = spacing * (totalBoxes - 1);
          final double boxWidth =
              (constraints.maxWidth - totalSpacing) / totalBoxes;

          return Row(
            children: List.generate(totalBoxes, (index) {
              return Container(
                width: boxWidth,
                margin: EdgeInsets.only(
                  right: index == totalBoxes - 1 ? 0 : spacing,
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: index <= activeIndex
                        ? boxColors[index]
                        : const Color(0xFFEFF1F3),
                    borderRadius: BorderRadius.circular(4),
                    border: const Border(
                      right: BorderSide(color: Color(0xFFE8E8E8), width: 2),
                      bottom: BorderSide(color: Color(0xFFE8E8E8), width: 4),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
