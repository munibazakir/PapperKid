import 'package:flutter/material.dart';
import 'app_slogen.dart';
import 'appname_text.dart';

class SplashTexts extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final Animation<Offset> nameSlide;
  final Animation<Offset> sloganSlide;

  const SplashTexts({
    super.key,
    required this.fadeAnimation,
    required this.nameSlide,
    required this.sloganSlide,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: Column(
        children: [
          SlideTransition(position: nameSlide, child: const AppNameText()),
          const SizedBox(height: 8),
          SlideTransition(position: sloganSlide, child: const AppSlogen()),
        ],
      ),
    );
  }
}
