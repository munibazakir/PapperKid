import 'package:alphabetsandcounting/utils/image.dart';
import 'package:alphabetsandcounting/widgets/count/medium/quiz_flow.dart';
import 'package:flutter/material.dart';
import '../../modules/lock_animation/coin_fly_animation.dart';
import '../../modules/lock_animation/level_lock.dart';
import '../../modules/lock_animation/level_state.dart';
import '../../widgets/count/advance/advance_level_flow.dart';
import '../../widgets/count/basic/counting_flow.dart';
import '../../widgets/count/general/count_appbar.dart';
import '../../widgets/count/general/count_level_button.dart';
import '../../widgets/count/general/count_level_button_last.dart';
import '../../widgets/count/general/count_navbar.dart';

class CountLevelScreen extends StatefulWidget {
  const CountLevelScreen({super.key});

  @override
  State<CountLevelScreen> createState() => _CountLevelScreenState();
}

class _CountLevelScreenState extends State<CountLevelScreen>
    with TickerProviderStateMixin {
  int coins = 0;

  // Level unlock state
  final List<LevelState> levels = [
    LevelState(unlocked: true), // Basic
    LevelState(unlocked: false), // subtraction
    LevelState(unlocked: false), // Multiplication
    LevelState(unlocked: false), // Elite
  ];

  late final List<AnimationController> _controllers;
  late final List<Animation<Offset>> _slideAnimations;
  final int _numButtons = 4;

  // Keys for coin animation
  final GlobalKey _basicKey = GlobalKey();
  final GlobalKey _mediumKey = GlobalKey();
  final GlobalKey _advanceKey = GlobalKey();
  final GlobalKey _eliteKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
      _numButtons,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
      ),
    );
    _slideAnimations = _controllers
        .map(
          (c) => Tween<Offset>(
            begin: Offset(0, 0.5),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: c, curve: Curves.easeOut)),
        )
        .toList();

    // Staggered animation
    for (int i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: 150 * i), () {
        if (mounted) _controllers[i].forward();
      });
    }
  }

  Offset _getCenter(GlobalKey key) {
    final box = key.currentContext!.findRenderObject() as RenderBox;
    return box.localToGlobal(Offset.zero) + box.size.center(Offset.zero);
  }

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
      builder: (_) => CoinFlyAnimation(
        start: start,
        end: end,
        onCompleted: () {
          entry.remove();
          setState(() {
            coins += 10;
            levels[nextLevel].unlocked = true;
          });
        },
      ),
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

  // Fixed _animatedBox reference
  Widget _animatedBox({required Widget child, required int index}) {
    if (_slideAnimations.isEmpty ||
        index < 0 ||
        index >= _slideAnimations.length) {
      return child; // fallback if list not ready
    }
    return SlideTransition(position: _slideAnimations[index], child: child);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF9F4),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                const CountAppBar(),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Level 1 - Basic
                      _animatedBox(
                        index: 0,
                        child: LevelLockWrapper(
                          isLocked: !levels[0].unlocked,
                          blurHeight: 0,
                          child: CountLevelButton(
                            key: _basicKey,
                            tagColor: const Color(0xFF3B82F6),
                            tagText: "Level 1",
                            heading: 'Basic',
                            description: 'Counting 1 to 10',
                            imagePath: AppImage.countLevel1,
                            progress: 0.4,
                            progressColor: const Color(0xFF3B82F6),
                            descriptionColor: const Color(0xFFB08A63),
                            onTap: () async {
                              final completed = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CountingFlow(),
                                ),
                              );

                              if (completed == true) {
                                await flyCoins(_basicKey, _mediumKey, 1);
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Level 2 - Medium
                      _animatedBox(
                        index: 1,
                        child: LevelLockWrapper(
                          isLocked: !levels[1].unlocked,
                          blurHeight: 136,
                          child: CountLevelButton(
                            key: _mediumKey,
                            tagColor: const Color(0xFF22C55E),
                            tagText: "Level 2",
                            heading: 'Medium',
                            description: 'Addition Fun',
                            imagePath: AppImage.countLevel2,
                            progress: 0.6,
                            progressColor: const Color(0xFF22C55E),
                            descriptionColor: const Color(0xFFB99E85),
                            // isLocked: !levels[1].unlocked,
                            onTap: () async {
                              if (!levels[1].unlocked) return;
                              final completed = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CountingQuizFlow(),
                                ),
                              );
                              if (completed == true) {
                                await flyCoins(_mediumKey, _advanceKey, 2);
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Level 3 - Advance
                      _animatedBox(
                        index: 2,
                        child: LevelLockWrapper(
                          isLocked: !levels[2].unlocked,
                          blurHeight: 136,
                          child: CountLevelButton(
                            key: _advanceKey,
                            tagColor: const Color(0xFFF97316),
                            tagText: "Level 3",
                            heading: 'Advanced',
                            description: 'Subtraction',
                            imagePath: AppImage.countLevel3,
                            progress: 0.4,
                            progressColor: const Color(0xFFF97316),
                            descriptionColor: const Color(0xFFB99E85),
                            // isLocked: !levels[2].unlocked,
                            onTap: () async {
                              if (!levels[2].unlocked) return;

                              final completed = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AdvanceLevelFlow(),
                                ),
                              );

                              if (completed == true) {
                                await flyCoins(_advanceKey, _eliteKey, 3);
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Level 4 - Sentence
                      _animatedBox(
                        index: 3,
                        child: LevelLockWrapper(
                          isLocked: !levels[3].unlocked,
                          blurHeight: 147,
                          child: const CountLevelLastButton(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Bottom container
                Container(
                  width: 282.95,
                  height: 36,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFB89060),
                    borderRadius: BorderRadius.circular(48),
                    border: Border.all(
                      color: const Color(0xFFF7EFE4),
                      width: 2,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Some Text Here",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CountButtomNavbar(),
    );
  }
}
