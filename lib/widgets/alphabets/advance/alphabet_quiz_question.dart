import 'package:flutter/material.dart';

class AlphabetQuizQuestion extends StatelessWidget {
  const AlphabetQuizQuestion({super.key, required this.heading});

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159.234,
      height: 52,
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(9999),
        border: Border.all(color: Color(0xFFFDEFD6), width: 4),
      ),
      child: Center(
        child: Text(
          heading,
          style: TextStyle(
            fontFamily: 'SplineSans',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF374151),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
