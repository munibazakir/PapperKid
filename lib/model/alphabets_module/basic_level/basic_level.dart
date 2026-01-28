import 'package:alphabetsandcounting/widgets/alphabets/general/element_appbar.dart';
import 'package:flutter/material.dart';
import '../../../widgets/alphabets/general/left_container_with_img.dart';
import '../../../widgets/alphabets/general/right_image.dart';
import '../../../widgets/alphabets/general/volumn_up_button.dart';
import 'package:audioplayers/audioplayers.dart';

class AlphabetScreen extends StatelessWidget {
  final String heading;
  final String leftImage;
  final String nextText;
  final VoidCallback onNext;
  final AudioPlayer player = AudioPlayer();

  AlphabetScreen({
    super.key,
    required this.heading,
    required this.leftImage,
    required this.nextText,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Responsive widths
    final leftWidth = size.width * 0.55; // left container width
    final leftHeight = 288.0; // fixed height for left container
    final rightWidth = 160.0;
    final rightHeight = 160.0;

    return Scaffold(
      backgroundColor: Color(0xFFF5F3DD),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// AppBar
            ElementAppbar(heading: heading),
            const SizedBox(height: 24),

            /// Body Content with Stack
            SizedBox(
              height: leftHeight, // Stack height same as left container
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  /// Left Container With Image
                  LeftContainerWithImg(
                    leftWidth: leftWidth,
                    leftHeight: leftHeight,
                    leftImage: leftImage,
                  ),

                  /// Right Image
                  RightImage(
                    leftWidth: leftWidth,
                    rightWidth: rightWidth,
                    rightHeight: rightHeight,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 48),

            /// Buttons
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Play Sound Button
                PlaySoundButton(
                  onPressed: () async {
                    // Extract letter from heading
                    String letter = heading
                        .split(' ')
                        .last
                        .trim(); // "Letter A" -> "A"

                    // Play sound
                    try {
                      await player.play(
                        AssetSource('alphabetsSound/$letter.mp3'),
                      );
                    } catch (e) {
                      print("Error playing sound: $e");
                    }
                  },
                ),

                const SizedBox(height: 48),

                /// Next / Finish Text
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: onNext,
                    child: Text(
                      nextText,
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
          ],
        ),
      ),
    );
  }
}
