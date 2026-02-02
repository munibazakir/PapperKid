import 'package:flutter/material.dart';

import '../../../model/alphabets_module/abc_level_screen.dart';
import '../../../model/alphabets_module/basic_level/basic_level.dart';
import '../../../model/alphabets_module/congratulation_screen.dart';

class AlphabetFlow extends StatefulWidget {
  final int startIndex;
  AlphabetFlow({super.key, this.startIndex = 0});

  @override
  State<AlphabetFlow> createState() => _AlphabetFlowState();
}

class _AlphabetFlowState extends State<AlphabetFlow> {
  int currentIndex = 0;
  bool showCongrats = false;

  final List<String> letters = List.generate(
    26,
    (i) => String.fromCharCode(65 + i),
  );

  @override
  void initState() {
    super.initState();
    currentIndex = widget.startIndex;
  }

  @override
  Widget build(BuildContext context) {
    if (showCongrats) {
      final bool isLastLetter = currentIndex == 25;
      final double progress = (currentIndex + 1) / letters.length;

      return CustomCongrtScreen(
        headingText: "Great Job!",
        detailText: "You completed letter ${letters[currentIndex]}",
        leftText: isLastLetter ? "" : "Next Letter",
        rightText: "⭐",
        progress: progress,
        onNextLessonPressed: () {
          if (isLastLetter) {
            Navigator.pop(context, true); // 🔥 BASIC LEVEL COMPLETE

            return;
          }

          setState(() {
            currentIndex++;
            showCongrats = false;
          });
        },
        onBackToMapPressed: () => Navigator.pop(context),
      );
    }

    return AlphabetScreen(
      heading: "Letter ${letters[currentIndex]}",
      leftImage: "assets/alphabets/${letters[currentIndex]}.png",
      nextText: "Next",
      onNext: () => setState(() => showCongrats = true),
    );
  }
}
