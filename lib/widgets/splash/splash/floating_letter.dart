import 'package:flutter/material.dart';

class FloatingLetter extends StatelessWidget {
  final String letter;
  final Color color;
  final double left;
  final double top;
  final double size;
  final Animation<double> floatAnim;

  const FloatingLetter({
    super.key,
    required this.letter,
    required this.color,
    required this.left,
    required this.top,
    required this.size,
    required this.floatAnim,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: floatAnim,
      builder: (context, child) {
        return Positioned(
          left: left,
          top: top + floatAnim.value,
          child: child!,
        );
      },
      child: Text(
        letter,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
