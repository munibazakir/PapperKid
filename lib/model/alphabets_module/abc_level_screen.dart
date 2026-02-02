import 'package:flutter/material.dart';
import '../../modules/lock_animation/coin_fly_animation.dart';
import '../../modules/lock_animation/level_lock.dart';
import '../../modules/lock_animation/level_state.dart';
import '../../utils/image.dart';
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
  // Coins counter
  int coins = 0;

  // Level unlock state
  final List<LevelState> levels = [
    LevelState(unlocked: true), // Basic
    LevelState(unlocked: false), // Medium
    LevelState(unlocked: false), // Advance
    LevelState(unlocked: false), // Sentence
  ];

  // Slide animation controllers
  static const int _numBoxes = 4;
  late final List<AnimationController> _controllers;
  late final List<Animation<Offset>> _slideAnimations;

  // Keys for coin animation positions
  final GlobalKey _basicKey = GlobalKey();
  final GlobalKey _mediumKey = GlobalKey();
  final GlobalKey _advanceKey = GlobalKey();
  final GlobalKey _sentenceKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    // Slide animations
    _controllers = List.generate(
      _numBoxes,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      ),
    );

    _slideAnimations = _controllers
        .map(
          (controller) => Tween<Offset>(
            begin: const Offset(0, 0.4),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut)),
        )
        .toList();

    // Staggered slide animation
    for (int i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: 120 * i), () {
        if (mounted) _controllers[i].forward();
      });
    }
  }

  // Get center of widget for coin animation
  Offset _getCenter(GlobalKey key) {
    final RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
    final Offset topLeft = box.localToGlobal(Offset.zero);
    return topLeft + box.size.center(Offset.zero);
  }

  // Coin fly animation from one level to next
  Future<void> flyCoins(
    GlobalKey startKey,
    GlobalKey endKey,
    int nextLevel,
  ) async {
    final start = _getCenter(startKey);
    final end = _getCenter(endKey);

    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (_) {
        return CoinFlyAnimation(
          start: start,
          end: end,
          onCompleted: () {
            entry.remove();
            setState(() {
              coins += 10;
              levels[nextLevel].unlocked = true; // unlock next level
            });
          },
        );
      },
    );

    overlay.insert(entry);
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _animatedBox({required int index, required Widget child}) {
    return SlideTransition(position: _slideAnimations[index], child: child);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFE0F2FE),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ModuleHomeAppbar(
                heading: 'Alphabet Word',
                bgColor: const Color(0xFFE0F2FE),
              ),
              const SizedBox(height: 24),

              // Level 1 - Basic
              _animatedBox(
                index: 0,
                child: FeatureBox(
                  key: _basicKey,
                  width: size.width - 32,
                  height: 168,
                  image: AppImage.alpLevel1,
                  topText: "Level 1",
                  heading: "Basic",
                  description: "Learning A to Z",
                  borderColor: const Color(0xFFB7F2CC),
                  shadowColor: const Color(0xFFC9F5D9),
                  textColor: const Color(0xFF4ADE80),
                  onTap: () async {
                    final completed = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AlphabetFlow()),
                    );

                    if (completed == true) {
                      await flyCoins(
                        _basicKey,
                        _mediumKey,
                        1,
                      ); // Basic → Medium
                    }
                  },
                ),
              ),
              SizedBox(height: 16),
              // Level 2 - Medium
              _animatedBox(
                index: 1,
                child: LevelLockWrapper(
                  isLocked: !levels[1].unlocked,
                  child: FeatureBox(
                    key: _mediumKey,
                    width: size.width - 32,
                    height: 168,
                    image: AppImage.alpLevel2,
                    topText: "Level 2",
                    heading: "Medium",
                    description: "Phonics & Sounds",
                    borderColor: const Color(0xFFBFDBFD),
                    shadowColor: const Color(0xFFCFE4FD),
                    textColor: const Color(0xFF60A5FA),
                    isLocked: !levels[1].unlocked,
                    onTap: () async {
                      if (!levels[1].unlocked) return;
                      final completed = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => MediumLevelFlow()),
                      );

                      if (completed == true) {
                        await flyCoins(
                          _mediumKey,
                          _advanceKey,
                          2,
                        ); // Medium → Advance
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Level 3 - Advance
              _animatedBox(
                index: 2,
                child: LevelLockWrapper(
                  isLocked: !levels[2].unlocked,
                  child: FeatureBox(
                    key: _advanceKey,
                    width: size.width - 32,
                    height: 168,
                    image: AppImage.alpLevel3,
                    topText: "Level 3",
                    heading: "Advance",
                    description: "Spelling & Words",
                    borderColor: const Color(0xFFDCD1FD),
                    shadowColor: const Color(0xFFE5DCFD),
                    textColor: const Color(0xFFA78BFA),
                    isLocked: !levels[2].unlocked,
                    onTap: () async {
                      if (!levels[2].unlocked) return;
                      final completed = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AdvancedLevelFlow(
                            soundPath: alphabets[0]['soundPath'],
                          ),
                        ),
                      );

                      if (completed == true) {
                        await flyCoins(
                          _advanceKey,
                          _sentenceKey,
                          3,
                        ); // Advance → Sentence
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Level 4 - Sentence
              _animatedBox(
                index: 3,
                child: LevelLockWrapper(
                  isLocked: !levels[3].unlocked,
                  child: LastFeatureBox(
                    key: _sentenceKey,
                    width: size.width - 32,
                    height: 185.5,
                    imagePath: AppImage.alpLevel4,
                    topText: "New Level Mastery *",
                    heading: "My First Sentence",
                    description: "Ready for tables & stories!",
                  ),
                ),
              ),

              const SizedBox(height: 24),

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
