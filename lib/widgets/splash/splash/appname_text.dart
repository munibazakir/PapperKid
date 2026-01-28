import 'package:flutter/material.dart';

class AppNameText extends StatelessWidget {
  const AppNameText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Paper Kids',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 48,
        color: Color(0xFF1F2937),
        height: 1,
      ),
    );
  }
}
