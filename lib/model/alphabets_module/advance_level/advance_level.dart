import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../../../widgets/alphabets/advance/alphabets_data.dart';
import '../../../widgets/alphabets/advance/start_quiz_btn.dart';
import '../../../widgets/alphabets/general/element_appbar.dart';
import '../../../widgets/alphabets/general/left_container_with_img.dart';
import '../../../widgets/alphabets/general/right_image.dart';
import '../../../widgets/alphabets/general/volumn_up_button.dart';
import '../congratulation_screen.dart';
import 'quiz_screen.dart';

class AdvancedLevelFlow extends StatefulWidget {
  final String soundPath;

  const AdvancedLevelFlow({super.key, required this.soundPath});

  @override
  State<AdvancedLevelFlow> createState() => _AdvancedLevelFlowState();
}

class _AdvancedLevelFlowState extends State<AdvancedLevelFlow> {
  int currentIndex = 0;
  bool showCongrats = false;

  @override
  void initState() {
    super.initState();
    player.setReleaseMode(ReleaseMode.stop);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Map<String, dynamic> get current => alphabets[currentIndex];

  void nextLetter() {
    setState(() {
      showCongrats = true; // Show congrats screen after quiz
    });
  }

  final AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    final bool isLastLetter = currentIndex == alphabets.length - 1;

    //  CONGRATS SCREEN
    if (showCongrats) {
      final double progress =
          (currentIndex + 1) / alphabets.length; //  dynamic progress
      return CustomCongrtScreen(
        headingText: "Great Job!",
        detailText: "${current['letter']} completed",
        leftText: isLastLetter ? "" : "Next Letter",
        rightText: "Back to Map",
        progress: progress,
        onNextLessonPressed: () {
          if (!isLastLetter) {
            setState(() {
              currentIndex++;
              showCongrats = false;
            });
          }
        },
        onBackToMapPressed: () => Navigator.pop(context),
      );
    }

    //  ALL LETTERS FINISHED
    if (currentIndex >= alphabets.length) {
      return CustomCongrtScreen(
        headingText: "Alphabet King",
        detailText: "You have completed all letters test",
        leftText: "",
        rightText: "Back to Map",
        onNextLessonPressed: () {},
        onBackToMapPressed: () => Navigator.pop(context),
      );
    }

    //  NORMAL FLOW
    final size = MediaQuery.of(context).size;
    final leftWidth = size.width * 0.55;
    final leftHeight = 288.0;
    final rightWidth = 160.0;
    final rightHeight = 160.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F3DD),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// AppBar
            ElementAppbar(heading: "Advance Level"),
            const SizedBox(height: 24),

            /// Body with Stack
            SizedBox(
              height: leftHeight,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  LeftContainerWithImg(
                    leftWidth: leftWidth,
                    leftHeight: leftHeight,
                    leftImage: current['leftImage'],
                  ),
                  RightImage(
                    leftWidth: leftWidth,
                    rightWidth: rightWidth,
                    rightHeight: rightHeight,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),

            /// Play Sound Button
            PlaySoundButton(
              onPressed: () async {
                try {
                  await player.stop();
                  await player.play(
                    AssetSource(
                      alphabets[currentIndex]['soundPath']!.replaceFirst(
                        'assets/',
                        '',
                      ),
                    ),
                  );
                  debugPrint(
                    "Playing: ${alphabets[currentIndex]['soundPath']}",
                  );
                } catch (e) {
                  debugPrint("Sound error: $e");
                }
              },
            ),
            const SizedBox(height: 10),

            /// Start Quiz Button
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuizScreen(
                        currentIndex: currentIndex,
                        alphabets: alphabets,
                        onNext: nextLetter,
                      ),
                    ),
                  );
                },
                child: StartQuizBtn(size: size),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
