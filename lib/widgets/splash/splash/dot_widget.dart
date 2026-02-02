import 'package:flutter/material.dart';
import '../../../modules/splash/dot_animation.dart';

class SplashDot extends StatelessWidget {
  final Color color;
  final double delay;
  final AnimationController controller;

  const SplashDot({
    super.key,
    required this.color,
    required this.delay,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return dot_animation(controller: controller, color: color, delay: delay);
  }
}
