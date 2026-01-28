import 'package:flutter/material.dart';

import '../../../model/home/home_screen.dart';

class TopSkipText extends StatelessWidget {
  const TopSkipText({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      right: 24,
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        },
        child: const Text(
          'Skip',
          style: TextStyle(
            fontFamily: 'SplineSans',
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Color(0xFF9CA3AF),
          ),
        ),
      ),
    );
  }
}
