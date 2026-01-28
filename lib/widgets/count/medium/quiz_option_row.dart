import 'package:flutter/material.dart';

import 'option_style.dart';

class QuizOptionsRow extends StatelessWidget {
  final List<int> options;
  final int correctAnswer;
  final VoidCallback onCorrectTap;
  final double outerSize;
  final double innerSize;

  const QuizOptionsRow({
    super.key,
    required this.options,
    required this.correctAnswer,
    required this.onCorrectTap,
    this.outerSize = 88,
    this.innerSize = 64,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(options.length, (index) {
        final value = options[index];
        final style = optionStyles[index];
        {
          return GestureDetector(
            onTap: () {
              if (value == correctAnswer) {
                onCorrectTap();
              } else {}
            },
            child: Container(
              width: outerSize,
              height: outerSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(style.bgImage),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: innerSize,
                  height: innerSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: style.innerBgColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: style.outerBorderColor, width: 4),
                  ),
                  child: Text(
                    "$value",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: style.textColor,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      }).toList(),
    );
  }
}
