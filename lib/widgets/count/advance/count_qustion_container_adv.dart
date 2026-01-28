import 'package:flutter/material.dart';
import '../../../model/counting_module/advance/advance_level.dart';
import '../medium/progress_dots.dart';
import '../medium/question_row.dart';

class CountQuestionContainerAdv extends StatelessWidget {
  const CountQuestionContainerAdv({
    super.key,
    required this.question,
    required this.dotColors,
  });

  final quizQuestionsAdvance question;
  final List<Color> dotColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 312,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF4A90E2),
        borderRadius: BorderRadius.circular(48),
        border: Border.all(color: const Color(0xFF4A90E2), width: 8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 160,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1C1E),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: const Color(0xFF2C3E50), width: 4),
            ),
            child: MathQuestionRow(
              firstNumber: question.a,
              secondNumber: question.b,
              sign: question.sign,
            ),
          ),
          const SizedBox(height: 16),
          ProgressDots(colors: dotColors),
        ],
      ),
    );
  }
}
