import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../../../widgets/alphabets/general/element_appbar.dart';
import '../../../widgets/alphabets/general/left_container_with_img.dart';
import '../../../widgets/alphabets/general/right_image.dart';
import '../../../widgets/alphabets/general/volumn_up_button.dart';

class CountingScreen extends StatefulWidget {
  final String heading;
  final String leftImage;
  final String nextText;
  final VoidCallback onNext;

  CountingScreen({
    super.key,
    required this.heading,
    required this.leftImage,
    required this.nextText,
    required this.onNext,
  });

  @override
  State<CountingScreen> createState() => _CountingScreenState();
}

class _CountingScreenState extends State<CountingScreen> {
  late final AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.setReleaseMode(ReleaseMode.stop);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            ElementAppbar(heading: widget.heading),
            const SizedBox(height: 24),
            SizedBox(
              height: leftHeight,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  LeftContainerWithImg(
                    leftWidth: leftWidth,
                    leftHeight: leftHeight,
                    leftImage: widget.leftImage,
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
            PlaySoundButton(
              onPressed: () async {
                String number = widget.heading.split(' ').last.trim();
                try {
                  await player.stop();
                  await player.play(AssetSource('countSound/$number.mp3'));
                  debugPrint("Playing sound for number $number");
                } catch (e) {
                  debugPrint("Error playing sound: $e");
                }
              },
            ),
            const SizedBox(height: 48),
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
