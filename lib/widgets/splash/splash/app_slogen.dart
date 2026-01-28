import 'package:flutter/material.dart';

class AppSlogen extends StatelessWidget {
  const AppSlogen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'ABC and 123 Learning',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'SplineSans',
        fontWeight: FontWeight.w700,
        color: Color(0xFF9CA3AF),
        fontSize: 14,
        height: 1,
        letterSpacing: 3.36,
      ),
    );
  }
}
