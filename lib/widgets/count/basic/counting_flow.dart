import 'package:flutter/material.dart';
import '../../../model/alphabets_module/congratulation_screen.dart';
import '../../../model/counting_module/basic/count_basic_level.dart';

class CountingFlow extends StatefulWidget {
  const CountingFlow({super.key});

  @override
  State<CountingFlow> createState() => _CountingFlowState();
}

class _CountingFlowState extends State<CountingFlow> {
  int currentIndex = 0;
  bool showCongrats = false;

  final List<int> numbers = List.generate(10, (i) => i + 1); // 1–10

  @override
  Widget build(BuildContext context) {
    final bool isLastNumber = currentIndex == numbers.length - 1;

    /// Last number ke baad → Congratulations
    ///  CONGRATS SCREEN
    if (showCongrats) {
      return CustomCongrtScreen(
        headingText: "Great Job!",
        detailText: "${numbers[currentIndex]} completed",
        leftText: isLastNumber ? "" : "Next Number",
        rightText: "Back to Map",

        onNextLessonPressed: () {
          if (isLastNumber) return; // last number pe kuch nahi

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

    ///  NUMBER SCREEN
    return CountingScreen(
      heading: numbers[currentIndex].toString(),
      leftImage: "assets/counts/${numbers[currentIndex]}.png",
      nextText: currentIndex < 9 ? "Next" : "Finish",
      onNext: () {
        setState(() {
          showCongrats = true; // click Next → show congrats
        });
      },
    );
  }
}
