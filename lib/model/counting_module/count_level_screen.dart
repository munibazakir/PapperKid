import 'package:alphabetsandcounting/utils/image.dart';
import 'package:alphabetsandcounting/widgets/count/medium/quiz_flow.dart';
import 'package:flutter/material.dart';
import '../../widgets/count/advance/advance_level_flow.dart';
import '../../widgets/count/basic/counting_flow.dart';
import '../../widgets/count/general/count_appbar.dart';
import '../../widgets/count/general/count_level_button.dart';
import '../../widgets/count/general/count_level_button_last.dart';
import '../../widgets/count/general/count_navbar.dart';

class CountLevelScreen extends StatefulWidget {
  CountLevelScreen({super.key});

  @override
  State<CountLevelScreen> createState() => _CountLevelScreenState();
}

class _CountLevelScreenState extends State<CountLevelScreen>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  late final List<Animation<Offset>> _slideAnimations;
  final int _numButtons = 4; // 4 CountLevelButtons

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
          (controller) => Tween<Offset>(
            begin: const Offset(0, 0.5), // start below
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

  Widget _buildAnimatedButton({required Widget child, required int index}) {
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
    return Scaffold(
      backgroundColor: Color(0xFFFDF9F4),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                // Top AppBar
                const CountAppBar(),
                const SizedBox(height: 24),

                // Center Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Level 1
                      _buildAnimatedButton(
                        index: 0,
                        child: CountLevelButton(
                          tagColor: Color(0xFF3B82F6),
                          tagText: "Level 1",
                          heading: 'Basic',
                          description: 'Counting 1 to 10',
                          imagePath: AppImage.countLevel1,
                          progress: 0.4,
                          progressColor: Color(0xFF3B82F6),
                          descriptionColor: Color(0xFFB08A63),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => CountingFlow()),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Level 2
                      _buildAnimatedButton(
                        index: 1,
                        child: CountLevelButton(
                          tagColor: Color(0xFF22C55E),
                          tagText: "Level 2",
                          heading: 'Medium',
                          description: 'Addition Fun',
                          imagePath: AppImage.countLevel2,
                          progress: 0.6,
                          progressColor: Color(0xFF22C55E),
                          descriptionColor: Color(0xFFB99E85),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CountingQuizFlow(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Level 3
                      _buildAnimatedButton(
                        index: 2,
                        child: CountLevelButton(
                          tagColor: Color(0xFFF97316),
                          tagText: "Level 3",
                          heading: 'Advanced',
                          description: 'Subtraction',
                          imagePath: AppImage.countLevel3,
                          progress: 0.4,
                          progressColor: Color(0xFFF97316),
                          descriptionColor: Color(0xFFB99E85),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AdvanceLevelFlow(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Level 4
                      _buildAnimatedButton(
                        index: 3,
                        child: CountLevelLastButton(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Bottom Center Container 
                Container(
                  width: 282.953125,
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
      bottomNavigationBar: CountButtomNavbar(),
    );
  }
}
