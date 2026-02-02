import 'package:flutter/material.dart';

class dot_animation extends StatelessWidget {
  const dot_animation({
    super.key,
    required AnimationController controller,
    required this.color,
    required this.delay,
  }) : _controller = controller;

  final AnimationController _controller;
  final Color color;
  final double delay;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(delay, delay + 0.5, curve: Curves.easeInOut),
        ),
      ),
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(9999),
        ),
      ),
    );
  }
}
