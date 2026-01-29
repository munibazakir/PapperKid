import 'package:flutter/material.dart';
import '../advance/alphabet_quiz_question.dart';

class QuizAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String heading;

  const QuizAppbar({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: preferredSize.height,
      color: Color(0xFFF0F9FF),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///  LEFT BOX
            GestureDetector(
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(9999),
                  border: Border.all(color: Color(0xFFFFFFFF), width: 2),
                ),
                child: Center(
                  child: Icon(
                    Icons.chevron_left,
                    size: 24,
                    color: Color(0xFFF4AE34),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16), // spacing
            ///  Question
            AlphabetQuizQuestion(heading: heading),

            const SizedBox(width: 16), // spacing
            ///  RIGHT CIRCLE AVATAR with settings icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(9999),
                border: Border.all(color: Color(0xFFFFFFFF), width: 2),
              ),
              child: Center(
                child: Icon(Icons.pause, size: 24, color: Color(0xFFF4AE34)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(112);
}
