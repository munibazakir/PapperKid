import 'package:flutter/material.dart';
import '../../../widgets/count/advance/count_qustion_container_adv.dart';
import '../../../widgets/count/medium/count_buttom_info.dart';
import '../../../widgets/count/medium/count_last_text.dart';
import '../../../widgets/count/medium/counting_quiz_appbar.dart';
import '../../../widgets/count/medium/quiz_info.dart';
import '../../../widgets/count/medium/quiz_option_row.dart';

class quizQuestionsAdvance {
  final int a;
  final int b;
  final String sign;
  final List<int> options;
  final int correct;

  quizQuestionsAdvance({
    required this.a,
    required this.b,
    required this.sign,
    required this.options,
    required this.correct,
  });
}

class QuizScreenAdvance extends StatelessWidget {
  final quizQuestionsAdvance question;
  final String levelText;
  final double progress;
  final VoidCallback onCorrectTap;
  final List<Color> dotColors;

  const QuizScreenAdvance({
    super.key,
    required this.question,
    required this.levelText,
    required this.progress,
    required this.onCorrectTap,
    this.dotColors = const [
      Color(0xFFF87171),
      Color(0xFFFACC15),
      Color(0xFF60A5FA),
      Color(0xFF4ADE80),
      Color(0xFFC084FC),
      Color(0xFFFB923C),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0F2FE),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CountQuizAppbar(),
            // const SizedBox(height: 32),

            /// MAIN CONTAINER
            Padding(
              padding: EdgeInsets.all(24),
              child: CountQuestionContainerAdv(
                question: question,
                dotColors: dotColors,
              ),
            ),

            // const SizedBox(height: 32),
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: QuizOptionsRow(
                options: question.options,
                correctAnswer: question.correct,
                onCorrectTap: onCorrectTap,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: QuizInfoRow(rightText: levelText),
            ),
            const SizedBox(height: 12),

            CountButtomInfo(progress: progress),
            const SizedBox(height: 8),
            CountLastText(),
          ],
        ),
      ),
    );
  }
}
