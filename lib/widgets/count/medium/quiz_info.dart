import 'package:flutter/material.dart';

class QuizInfoRow extends StatelessWidget {
  final String rightText;

  const QuizInfoRow({super.key, required this.rightText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Left side (icon + text)
        Row(
          children: [
            Image.asset(
              "assets/images/settings_suggest.png",
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 2),
            Text(
              "Machine Status",
              style: TextStyle(
                fontFamily: "SplineSans",
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: Color(0xFF71717A),
              ),
            ),
          ],
        ),

        /// Right side (level text)
        Text(
          rightText,
          style: TextStyle(
            fontFamily: "SplineSans",
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xFF4A90E2),
          ),
        ),
      ],
    );
  }
}
