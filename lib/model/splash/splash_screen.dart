import 'dart:async';
import 'package:flutter/material.dart';
import '../../utils/image.dart';
import '../../widgets/splash/splash/app_slogen.dart';
import '../../widgets/splash/splash/appname_text.dart';
import '../../widgets/splash/splash/dot_animation.dart';
import 'loading_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();

    // 2 SECOND TIMER
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoadingScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _dot(Color color, double delay) {
    return dot_animation(controller: _controller, color: color, delay: delay);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF5F3DD),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// IMAGE
              Image.asset(
                AppImage.logo,
                width: size.width * 0.65,
                height: size.width * 0.65,
              ),

              const SizedBox(height: 30),

              /// HEADING
              AppNameText(),

              const SizedBox(height: 8),

              /// TEXT
              AppSlogen(),

              const SizedBox(height: 88),

              /// DOTS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _dot(Color(0xFFFF6B6B), 0.0),
                  const SizedBox(width: 12),
                  _dot(Color(0xFF4ECDC4), 0.2),
                  const SizedBox(width: 12),
                  _dot(Color(0xFFFFE66D), 0.4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
