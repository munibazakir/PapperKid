import 'package:flutter/material.dart';
import '../../../model/alphabets_module/basic_level/basic_level.dart';
import '../../../model/alphabets_module/congratulation_screen.dart';

class AlphabetFlow extends StatefulWidget {
  const AlphabetFlow({super.key});

  @override
  State<AlphabetFlow> createState() => _AlphabetFlowState();
}

class _AlphabetFlowState extends State<AlphabetFlow> {
  int currentIndex = 0;
  bool showCongrats = false;

  final List<String> letters = List.generate(
    26,
    (i) => String.fromCharCode(65 + i),
  ); // A-Z

  @override
  Widget build(BuildContext context) {
    ///  SHOW CONGRATS SCREEN
    if (showCongrats) {
      final bool isLastLetter = currentIndex == 25;

      return CustomCongrtScreen(
        headingText: "Great Job!",
        detailText: "You completed letter ${letters[currentIndex]}",
        leftText: isLastLetter ? "" : "Next Letter",
        rightText: "⭐",

        ///  NEXT LETTER BUTTON
        onNextLessonPressed: () {
          if (isLastLetter) return;

          setState(() {
            currentIndex++;
            showCongrats = false;
          });
        },

        ///  BACK TO LEVEL
        onBackToMapPressed: () {
          Navigator.pop(context);
        },
      );
    }

    ///  SHOW LETTER SCREEN
    return AlphabetScreen(
      heading: "Letter ${letters[currentIndex]}",
      leftImage: "assets/alphabets/${letters[currentIndex]}.png",
      nextText: "Next",
      onNext: () {
        setState(() {
          showCongrats = true; // After Every Letter
        });
      },
    );
  }
}
