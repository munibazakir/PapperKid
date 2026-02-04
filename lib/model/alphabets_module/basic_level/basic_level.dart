import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../modules/controller/progress_controller.dart';
import '../../../widgets/alphabets/general/element_appbar.dart';
import '../../../widgets/alphabets/general/left_container_with_img.dart';
import '../../../widgets/alphabets/general/volumn_up_button.dart';

class AlphabetScreen extends StatefulWidget {
  final String heading;
  final String leftImage;
  final String nextText;
  final VoidCallback onNext;

  const AlphabetScreen({
    super.key,
    required this.heading,
    required this.leftImage,
    required this.nextText,
    required this.onNext,
  });

  @override
  State<AlphabetScreen> createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends State<AlphabetScreen> {
  late final ProgressController progress;
  late final AudioPlayer player;

  int startIndex = 0; // default first letter

  @override
  void initState() {
    super.initState();
    progress = Get.find<ProgressController>();
    player = AudioPlayer();
    startIndex = progress.getLastIndex(ModuleType.abc, LevelType.basic);
  }

  @override
  void dispose() {
    player.dispose(); // release audio resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final leftWidth = size.width * 0.55;
    final leftHeight = 288.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F3DD),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppBar
            ElementAppbar(heading: widget.heading),
            const SizedBox(height: 24),

            // Body content with left image
            SizedBox(
              height: leftHeight,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: LeftContainerWithImg(
                      leftWidth: leftWidth,
                      leftHeight: leftHeight,
                      leftImage: widget.leftImage,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 48),

            // Play sound button
            PlaySoundButton(
              onPressed: () async {
                String letter = widget.heading
                    .split(' ')
                    .last
                    .trim(); // "Letter A" -> "A"
                try {
                  await player.play(AssetSource('alphabetsSound/$letter.mp3'));
                } catch (e) {
                  print("Error playing sound: $e");
                }
              },
            ),

            const SizedBox(height: 48),

            // Next button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: widget.onNext,
                child: Text(
                  widget.nextText,
                  style: const TextStyle(
                    fontFamily: "SplineSans",
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
