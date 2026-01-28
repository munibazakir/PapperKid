import 'package:alphabetsandcounting/utils/image.dart';
import 'package:flutter/material.dart';
import '../../widgets/alphabets/advance/alphabets_data.dart';
import '../../widgets/alphabets/basic/alphabets_flow.dart';
import '../../widgets/alphabets/general/abc_last_level_button.dart';
import '../../widgets/alphabets/general/abc_level_button.dart';
import '../../widgets/alphabets/general/action_button.dart';
import '../../widgets/alphabets/general/module_home_appbar.dart';
import '../../widgets/alphabets/medium/medium_level_flow.dart';
import 'advance_level/advance_level.dart';

class AbcLevelScreen extends StatefulWidget {
  const AbcLevelScreen({super.key});

  @override
  State<AbcLevelScreen> createState() => _AbcLevelScreenState();
}

class _AbcLevelScreenState extends State<AbcLevelScreen>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  late final List<Animation<Offset>> _slideAnimations;
  final int _numBoxes = 4; // 3 FeatureBox + 1 LastFeatureBox

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
      _numBoxes,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
      ),
    );

    _slideAnimations = _controllers
        .map(
          (controller) => Tween<Offset>(
            begin: const Offset(0, 0.5),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut)),
        )
        .toList();

    // Staggered animation with delay
    for (int i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: 150 * i), () {
        if (mounted) _controllers[i].forward();
      });
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _buildAnimatedBox({required Widget child, required int index}) {
    return AnimatedBuilder(
      animation: _controllers[index],
      builder: (context, _) {
        return Opacity(
          opacity: _controllers[index].value,
          child: SlideTransition(
            position: _slideAnimations[index],
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFE0F2FE),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ModuleHomeAppbar(
                heading: 'Alphabet Word',
                bgColor: const Color(0xFFE0F2FE),
              ),
              const SizedBox(height: 24),

              // ✅ Level 1 - Basic
              _buildAnimatedBox(
                index: 0,
                child: FeatureBox(
                  width: size.width - 32,
                  height: 168,
                  image: AppImage.alpLevel1,
                  topText: "Level 1",
                  heading: "Basic",
                  description: "Learning A to Z",
                  borderColor: const Color(0xFFB7F2CC),
                  shadowColor: const Color(0xFFC9F5D9),
                  textColor: const Color(0xFF4ADE80),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AlphabetFlow()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // ✅ Level 2 - Medium
              _buildAnimatedBox(
                index: 1,
                child: FeatureBox(
                  width: size.width - 32,
                  height: 168,
                  image: AppImage.alpLevel2,
                  topText: "Level 2",
                  heading: "Medium",
                  description: "Phonics & Sounds",
                  borderColor: const Color(0xFFBFDBFD),
                  shadowColor: const Color(0xFFCFE4FD),
                  textColor: const Color(0xFF60A5FA),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => MediumLevelFlow()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // ✅ Level 3 - Advance
              _buildAnimatedBox(
                index: 2,
                child: FeatureBox(
                  width: size.width - 32,
                  height: 168,
                  image: AppImage.alpLevel3,
                  topText: "Level 3",
                  heading: "Advance",
                  description: "Spelling & Words",
                  borderColor: const Color(0xFFDCD1FD),
                  shadowColor: const Color(0xFFE5DCFD),
                  textColor: const Color(0xFFA78BFA),
                  onTap: () {
                    int indexToPlay = 0;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AdvancedLevelFlow(
                          soundPath: alphabets[indexToPlay]['soundPath'],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // ✅ Level 4 - Last FeatureBox
              _buildAnimatedBox(
                index: 3,
                child: LastFeatureBox(
                  width: size.width - 32,
                  height: 185.5,
                  imagePath: AppImage.alpLevel4,
                  topText: "New Level Mastery *",
                  heading: "My First Sentence",
                  description: "Ready for tables & stories!",
                ),
              ),
              const SizedBox(height: 24),

              // ✅ ActionBox (optional, no animation)
              ActionBox(
                height: 42,
                image: AppImage.touchApp,
                text: "Tap an island to start!",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
