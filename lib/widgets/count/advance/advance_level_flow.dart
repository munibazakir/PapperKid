import 'package:flutter/material.dart';
import '../../../model/alphabets_module/congratulation_screen.dart';
import '../../../model/counting_module/advance/advance_level.dart';

final List<quizQuestionsAdvance> quizQuestionsAdvanceList = [
  quizQuestionsAdvance(a: 5, b: 3, sign: '-', options: [7, 2, 9], correct: 2),
  quizQuestionsAdvance(a: 7, b: 2, sign: '-', options: [5, 9, 6], correct: 5),
  quizQuestionsAdvance(a: 4, b: 3, sign: '-', options: [7, 1, 9], correct: 1),
  quizQuestionsAdvance(a: 9, b: 1, sign: '-', options: [9, 8, 11], correct: 8),
  quizQuestionsAdvance(a: 6, b: 3, sign: '-', options: [3, 9, 4], correct: 3),
];

class AdvanceLevelFlow extends StatefulWidget {
  const AdvanceLevelFlow({super.key});

  @override
  State<AdvanceLevelFlow> createState() => _AdvanceLevelFlowState();
}

class _AdvanceLevelFlowState extends State<AdvanceLevelFlow> {
  int currentIndex = 0;
  bool showCongrats = false;

  final List<quizQuestionsAdvance> questions = quizQuestionsAdvanceList;

  @override
  Widget build(BuildContext context) {
    final bool isLastQuiz = currentIndex == questions.length - 1;

    ///  CONGRATS SCREEN (AFTER EVERY QUIZ)
    if (showCongrats) {
      final double progress = (currentIndex + 1) / questions.length;
      final current = questions[currentIndex];

      return CustomCongrtScreen(
        headingText: "Great Job!",
        detailText: "Quiz ${currentIndex + 1} completed",
        leftText: isLastQuiz ? "" : "Next Quiz",
        rightText: "Back to Map",
        progress: progress,
        onNextLessonPressed: () {
          if (isLastQuiz) return; // last quiz pe kuch nahi

          setState(() {
            currentIndex++;
            showCongrats = false;
          });
        },

        onBackToMapPressed: () {
          Navigator.pop(context);
        },
      );
    }

    ///  QUIZ SCREEN
    final current = questions[currentIndex];

    return QuizScreenAdvance(
      question: current,
      levelText: "Quiz ${currentIndex + 1}/${questions.length}",
      progress: (currentIndex + 1) / questions.length,

      onCorrectTap: () {
        setState(() {
          showCongrats = true; // show congrats after correct answer
        });
      },
    );
  }
}
