import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/alphabets_module/congratulation_screen.dart';
import '../../../model/alphabets_module/medium_level/medium_level.dart';
import '../../../modules/controller/alphabet_enum.dart';
import '../../../modules/controller/progress_controller.dart';

class MediumLevelFlow extends StatefulWidget {
  const MediumLevelFlow({super.key});

  @override
  State<MediumLevelFlow> createState() => _MediumLevelFlowState();
}

class _MediumLevelFlowState extends State<MediumLevelFlow> {
  final progressController = Get.find<ProgressController>();

  int currentIndex = 0;
  bool showCongrats = false; //  NEW

  final List<Map<String, String>> lettersWithPhonics = [
    {
      'letter': 'A',
      'phonic': 'Apple',
      'rightImage': 'apple.png',
      'soundPath': 'assets/phonicsSound/apple.mp3',
    },
    {
      'letter': 'B',
      'phonic': 'Ball',
      'rightImage': 'ball.png',
      'soundPath': 'assets/phonicsSound/ball.mp3',
    },
    {
      'letter': 'C',
      'phonic': 'Cat',
      'rightImage': 'cat.png',
      'soundPath': 'assets/phonicsSound/cat.mp3',
    },
    {
      'letter': 'D',
      'phonic': 'Dog',
      'rightImage': 'dog.png',
      'soundPath': 'assets/phonicsSound/dog.mp3',
    },
    {
      'letter': 'E',
      'phonic': 'Elephant',
      'rightImage': 'elephant.png',
      'soundPath': 'assets/phonicsSound/elephant.mp3',
    },
    {
      'letter': 'F',
      'phonic': 'Fish',
      'rightImage': 'fish.png',
      'soundPath': 'assets/phonicsSound/fish.mp3',
    },
    {
      'letter': 'G',
      'phonic': 'Goat',
      'rightImage': 'goat.png',
      'soundPath': 'assets/phonicsSound/goat.mp3',
    },
    {
      'letter': 'H',
      'phonic': 'Horse',
      'rightImage': 'horse.png',
      'soundPath': 'assets/phonicsSound/horse.mp3',
    },
    {
      'letter': 'I',
      'phonic': 'Ice Cream',
      'rightImage': 'ice-cream.png',
      'soundPath': 'assets/phonicsSound/ice_cream.mp3',
    },
    {
      'letter': 'J',
      'phonic': 'Jug',
      'rightImage': 'jug.png',
      'soundPath': 'assets/phonicsSound/jug.mp3',
    },
    {
      'letter': 'K',
      'phonic': 'Kite',
      'rightImage': 'kite.png',
      'soundPath': 'assets/phonicsSound/kite.mp3',
    },
    {
      'letter': 'L',
      'phonic': 'Light',
      'rightImage': 'light.png',
      'soundPath': 'assets/phonicsSound/light.mp3',
    },
    {
      'letter': 'M',
      'phonic': 'Monkey',
      'rightImage': 'monkey.png',
      'soundPath': 'assets/phonicsSound/monkey.mp3',
    },
    {
      'letter': 'N',
      'phonic': 'Nest',
      'rightImage': 'nest.png',
      'soundPath': 'assets/phonicsSound/nest.mp3',
    },
    {
      'letter': 'O',
      'phonic': 'Owl',
      'rightImage': 'owl.png',
      'soundPath': 'assets/phonicsSound/owl.mp3',
    },
    {
      'letter': 'P',
      'phonic': 'Parrot',
      'rightImage': 'parrot.png',
      'soundPath': 'assets/phonicsSound/parrot.mp3',
    },
    {
      'letter': 'Q',
      'phonic': 'Queen',
      'rightImage': 'queen.png',
      'soundPath': 'assets/phonicsSound/queen.mp3',
    },
    {
      'letter': 'R',
      'phonic': 'Rabbit',
      'rightImage': 'rabbit.png',
      'soundPath': 'assets/phonicsSound/rabbit.mp3',
    },
    {
      'letter': 'S',
      'phonic': 'Snake',
      'rightImage': 'snake.png',
      'soundPath': 'assets/phonicsSound/snake.mp3',
    },
    {
      'letter': 'T',
      'phonic': 'Tree',
      'rightImage': 'tree.png',
      'soundPath': 'assets/phonicsSound/tree.mp3',
    },
    {
      'letter': 'U',
      'phonic': 'Umbrella',
      'rightImage': 'umbrella.png',
      'soundPath': 'assets/phonicsSound/umbrella.mp3',
    },
    {
      'letter': 'V',
      'phonic': 'Violin',
      'rightImage': 'violin.png',
      'soundPath': 'assets/phonicsSound/violin.mp3',
    },
    {
      'letter': 'W',
      'phonic': 'Whale',
      'rightImage': 'whale.png',
      'soundPath': 'assets/phonicsSound/whale.mp3',
    },
    {
      'letter': 'X',
      'phonic': 'Xylophone',
      'rightImage': 'xylophone.png',
      'soundPath': 'assets/phonicsSound/xylophone.mp3',
    },
    {
      'letter': 'Y',
      'phonic': 'Yoyo',
      'rightImage': 'yoyo.png',
      'soundPath': 'assets/phonicsSound/yoyo.mp3',
    },
    {
      'letter': 'Z',
      'phonic': 'Zebra',
      'rightImage': 'zebra.png',
      'soundPath': 'assets/phonicsSound/zebra.mp3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final current = lettersWithPhonics[currentIndex];
    final bool isLastLetter = currentIndex == lettersWithPhonics.length - 1;

    ///  CONGRATS SCREEN (after every letter)
    if (showCongrats) {
      final double progress = (currentIndex + 1) / lettersWithPhonics.length;
      return CustomCongrtScreen(
        headingText: "Great Job!",
        detailText: "${current['letter']} for ${current['phonic']}",
        leftText: isLastLetter ? "" : "Next Letter",
        rewardCount: currentIndex + 1,
        progress: progress, //  pass dynamic progress
        onNextLessonPressed: () {
          // final bool isLastLetter = currentIndex == 25;
          final bool isLastLetter =
              currentIndex == lettersWithPhonics.length - 1;

          if (isLastLetter) {
            // Navigate to ABC Level Screen and trigger Medium unlock animation
            Navigator.pop(context, true); //  BASIC LEVEL COMPLETE

            return;
          }

          // For other letters, just go to the next letter
          setState(() {
            currentIndex++;
            showCongrats = false;

            // 🔹 Save progress for next letter
            progressController.saveProgress(
              level: AlphabetLevel.medium,
              index: currentIndex,
            );
          });
        },

        onBackToMapPressed: () {
          Navigator.pop(context);
        },
      );
    }

    ///  LETTER SCREEN
    return MediumLevelScreen(
      heading: "${current['letter']} for ${current['phonic']}",
      leftImage: "assets/alphabets/${current['letter']}.png",
      rightImage: "assets/alphabetsImages/${current['rightImage']}",
      soundPath: current['soundPath']!,
      nextText: "Next",
      onNext: () {
        setState(() {
          showCongrats = true;

          // 🔹 Save progress for current letter
          progressController.saveProgress(
            level: AlphabetLevel.medium,
            index: currentIndex,
          );
        });
      },
    );
  }
}
