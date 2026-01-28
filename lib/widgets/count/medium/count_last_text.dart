import 'package:flutter/material.dart';

class CountLastText extends StatelessWidget {
  const CountLastText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '"Spin the gear with the right answer!"',
      style: const TextStyle(
        fontFamily: "SplineSans",
        fontWeight: FontWeight.w500,
        color: Color(0xFF71717A),
        fontSize: 14,
      ),
    );
  }
}
