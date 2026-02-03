import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/alphabets_module/basic_level/basic_level.dart';
import '../../../model/alphabets_module/congratulation_screen.dart';
import '../../../modules/controller/alphabet_enum.dart';
import '../../../modules/controller/progress_controller.dart';

class AlphabetFlow extends StatefulWidget {
  final int startIndex;
  AlphabetFlow({super.key, this.startIndex = 0});

  @override
  State<AlphabetFlow> createState() => _AlphabetFlowState();
}

class _AlphabetFlowState extends State<AlphabetFlow> {
  final progressController = Get.find<ProgressController>();

  int currentIndex = 0;
  bool showCongrats = false;

  final List<String> letters = List.generate(
    26,
    (i) => String.fromCharCode(65 + i),
  );

  @override
  void initState() {
    super.initState();

    //  resume from saved progress
    currentIndex = progressController.getLastIndex(AlphabetLevel.basic);
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
        rewardCount: currentIndex + 1,
        progress: progress,
        //
        onNextLessonPressed: () {
          final bool isLastLetter = currentIndex == 25;

          //  Save progress BEFORE moving to next
          progressController.saveProgress(
            level: AlphabetLevel.medium,
            index: currentIndex,
          );

          if (isLastLetter) {
            Navigator.pop(context, true); // BASIC LEVEL COMPLETE
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
