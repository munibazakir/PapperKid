import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/alphabets_module/congratulation_screen.dart';
import '../../../model/counting_module/medium/medium_level.dart';
import '../../../modules/controller/progress_controller.dart';
import 'quiz_question.dart';

class CountingQuizFlow extends StatefulWidget {
  const CountingQuizFlow({super.key});

  @override
  State<CountingQuizFlow> createState() => _CountingQuizFlowState();
}

class _CountingQuizFlowState extends State<CountingQuizFlow> {
  final progressController = Get.find<ProgressController>();
  int currentIndex = 0;
  bool showCongrats = false;

  @override
  void initState() {
    super.initState();
    // Load last index from memory
    currentIndex = progressController.getLastIndexMedium();
  }

  final List<QuizQuestion> questions = quizQuestions;

  @override
  Widget build(BuildContext context) {
    final bool isLastQuiz = currentIndex == questions.length - 1;

    ///  CONGRATS SCREEN (AFTER EVERY QUIZ)
    if (showCongrats) {
      final double progress = (currentIndex + 1) / questions.length;
      return CustomCongrtScreen(
        headingText: "Great Job!",
        detailText: "Quiz ${currentIndex + 1} completed",
        leftText: isLastQuiz ? "" : "Next Quiz",
        rewardCount: currentIndex + 1,
        progress: progress,
        //  NEXT QUIZ
        onNextLessonPressed: () {
          final bool isLastLetter = currentIndex == questions.length - 1;

          // Save current progress
          progressController.saveLastIndexMedium(currentIndex);
          if (currentIndex > progressController.getUnlockedMediumLevel()) {
            progressController.setUnlockedMediumLevel(currentIndex);
          }

          if (isLastLetter) {
            Navigator.pop(context, true); // Medium level complete
            return;
          }

          setState(() {
            currentIndex++;
            showCongrats = false;
          });
        },

        //  BACK TO LEVEL
        onBackToMapPressed: () {
          Navigator.pop(context);
        },
      );
    }

    ///  QUIZ SCREEN
    final currentQuestion = questions[currentIndex];

    return QuizScreen(
      question: currentQuestion,
      levelText: "Quiz ${currentIndex + 1}/${questions.length}",
      progress: (currentIndex + 1) / questions.length,

      //  CORRECT ANSWER → SHOW CONGRATS
      onCorrectTap: () {
        setState(() {
          showCongrats = true;

          // Save current progress
          progressController.saveLastIndexMedium(currentIndex);
          if (currentIndex > progressController.getUnlockedMediumLevel()) {
            progressController.setUnlockedMediumLevel(currentIndex);
          }
        });
      },
    );
  }
}
