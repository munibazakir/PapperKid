import 'package:flutter/material.dart';
import '../../../model/alphabets_module/congratulation_screen.dart';
import '../../../model/counting_module/medium/medium_level.dart';
import 'quiz_question.dart';

class CountingQuizFlow extends StatefulWidget {
  const CountingQuizFlow({super.key});

  @override
  State<CountingQuizFlow> createState() => _CountingQuizFlowState();
}

class _CountingQuizFlowState extends State<CountingQuizFlow> {
  int currentIndex = 0;
  bool showCongrats = false; // ✅ VERY IMPORTANT

  final List<QuizQuestion> questions = quizQuestions;

  @override
  Widget build(BuildContext context) {
    final bool isLastQuiz = currentIndex == questions.length - 1;

    /// 🎉 CONGRATS SCREEN (AFTER EVERY QUIZ)
    if (showCongrats) {
      return CustomCongrtScreen(
        headingText: "Great Job!",
        detailText: "Quiz ${currentIndex + 1} completed",
        leftText: isLastQuiz ? "" : "Next Quiz",
        rightText: "Back to Map",

        // ✅ NEXT QUIZ
        onNextLessonPressed: () {
          if (isLastQuiz) return; // ⛔ last quiz pe kuch nahi

          setState(() {
            currentIndex++;
            showCongrats = false;
          });
        },

        // ✅ BACK TO LEVEL
        onBackToMapPressed: () {
          Navigator.pop(context);
        },
      );
    }

    /// 🧠 QUIZ SCREEN
    final currentQuestion = questions[currentIndex];

    return QuizScreen(
      question: currentQuestion,
      levelText: "Quiz ${currentIndex + 1}/${questions.length}",
      progress: (currentIndex + 1) / questions.length,

      // ✅ CORRECT ANSWER → SHOW CONGRATS
      onCorrectTap: () {
        setState(() {
          showCongrats = true;
        });
      },
    );
  }
}
