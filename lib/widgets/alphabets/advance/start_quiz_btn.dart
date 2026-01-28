import 'package:flutter/material.dart';

class StartQuizBtn extends StatelessWidget {
  const StartQuizBtn({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width - 32,
      height: 88,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFF4B4B),
        borderRadius: BorderRadius.circular(24),
        border: Border(
          bottom: BorderSide(width: 8, color: const Color(0xFFB91C1C)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.quiz, size: 36, color: Colors.white),
          SizedBox(width: 12),
          Text(
            "Start Quiz",
            style: TextStyle(
              fontFamily: "SplineSans",
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
