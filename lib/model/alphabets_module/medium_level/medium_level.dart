import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../../../widgets/alphabets/general/element_appbar.dart';
import '../../../widgets/alphabets/general/left_container_with_img.dart';
import '../../../widgets/alphabets/general/volumn_up_button.dart';
import '../../../widgets/alphabets/medium/dynamic_right_img.dart';

class MediumLevelScreen extends StatefulWidget {
  final String heading;
  final String leftImage;
  final String rightImage;
  final String nextText;
  final String soundPath;
  final VoidCallback onNext;

  const MediumLevelScreen({
    super.key,
    required this.heading,
    required this.leftImage,
    required this.rightImage,
    required this.nextText,
    required this.onNext,
    required this.soundPath,
  });

  @override
  State<MediumLevelScreen> createState() => _MediumLevelScreenState();
}

class _MediumLevelScreenState extends State<MediumLevelScreen> {
  late final AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer(); //  SAFE place
  }

  @override
  void dispose() {
    _player.dispose(); //  memory clean
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
                  DynamicRightImage(
                    leftWidth: leftWidth,
                    rightWidth: rightWidth,
                    rightHeight: rightHeight,
                    imagePath: widget.rightImage,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlaySoundButton(
                  onPressed: () async {
                    try {
                      await _player.stop();
                      await _player.play(
                        AssetSource(
                          widget.soundPath.replaceFirst('assets/', ''),
                        ),
                      );
                    } catch (e) {
                      debugPrint("Sound error: $e");
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
          ],
        ),
      ),
    );
  }
}
