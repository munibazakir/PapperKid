import 'package:alphabetsandcounting/utils/image.dart';
import 'package:alphabetsandcounting/widgets/alphabets/general/quiz_appbar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/alphabets/advance/alphabets_quiz_options.dart';

class QuizScreen extends StatelessWidget {
  final int currentIndex;
  final List<Map<String, dynamic>> alphabets;
  final VoidCallback onNext;

  const QuizScreen({
    super.key,
    required this.currentIndex,
    required this.alphabets,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final current = alphabets[currentIndex];
    // final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF0F9FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            QuizAppbar(heading: "Level 3"),

            /// Quiz Container
            Container(
              width: 218.3,
              padding: const EdgeInsets.fromLTRB(
                24,
                12,
                24,
                0,
              ), // top + bottom padding
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(48),
                border: Border(
                  bottom: BorderSide(width: 8, color: Color(0xFFE5E7EB)),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Find the letter",
                    style: const TextStyle(
                      fontFamily: "SplineSans",
                      fontSize: 20,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  // const SizedBox(height: 8),
                  Text(
                    current['letter'],
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                      fontSize: 72,
                      color: Color(0xFFF4AE34),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            /// Curved Row of 3 options
            AlphabetsQuizOptions(current: current, onNext: onNext),

            /// Center Image
            Image.asset(
              AppImage.quizImg,
              width: 112,
              height: 200,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 8),

            /// Caption text
            const Text(
              "Hurry! It's melting!",
              style: TextStyle(
                fontFamily: "SplineSans",
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: Color(0xFF9CA3AF),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
