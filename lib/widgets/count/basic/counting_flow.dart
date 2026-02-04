import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/alphabets_module/congratulation_screen.dart';
import '../../../model/counting_module/basic/count_basic_level.dart';
import '../../../modules/controller/progress_controller.dart';

class CountingFlow extends StatefulWidget {
  // final int? startIndex;
  const CountingFlow({super.key});

  @override
  State<CountingFlow> createState() => _CountingFlowState();
}

class _CountingFlowState extends State<CountingFlow> {
  late final ProgressController progressController;

  int currentIndex = 0;
  bool showCongrats = false;

  final List<int> numbers = List.generate(10, (i) => i + 1); // 1–10

  @override
  void initState() {
    super.initState();

    //  resume from saved progress
    // currentIndex = progressController.getLastIndex(AlphabetLevel.basic);
    // Resume from saved progress or passed startIndex
    // Safe: Get.find only after main initialized
    progressController = Get.find<ProgressController>();
    currentIndex = progressController.getLastIndex(
      ModuleType.counting,
      LevelType.basic,
    );
  }

  void saveProgress() {
    progressController.saveLastIndex(
      ModuleType.counting,
      LevelType.basic,
      currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isLastNumber = currentIndex == numbers.length - 1;

    ///  CONGRATS SCREEN
    if (showCongrats) {
      final double progress = (currentIndex + 1) / numbers.length;
      return CustomCongrtScreen(
        headingText: "Great Job!",
        detailText: "${numbers[currentIndex]} completed",
        leftText: isLastNumber ? "" : "Next Number",
        rewardCount: currentIndex + 1,
        progress: progress,
        onNextLessonPressed: () {
          if (isLastNumber) {
            Navigator.pop(context, true); //  BASIC LEVEL COMPLETE

            return;
          } // last number

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

  @override
  void dispose() {
    saveProgress(); // Save progress when leaving screen
    super.dispose();
  }
}
