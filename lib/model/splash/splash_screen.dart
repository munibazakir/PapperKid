import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/splash/splash_controller.dart';
import '../../widgets/splash/splash/dot_widget.dart';
import '../../widgets/splash/splash/floating_letter.dart';
import '../../utils/image.dart';
import '../../widgets/splash/splash/splash_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F3DD),
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFa8edea), Color(0xFFfed6e3)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Floating letters
          FloatingLetter(
            letter: 'A',
            color: Colors.red,
            left: size.width * 0.15,
            top: size.height * 0.2,
            size: 32,
            floatAnim: controller.floatA,
          ),
          FloatingLetter(
            letter: 'B',
            color: Colors.blue,
            left: size.width * 0.65,
            top: size.height * 0.25,
            size: 28,
            floatAnim: controller.floatB,
          ),
          FloatingLetter(
            letter: '3',
            color: Colors.yellow,
            left: size.width * 0.35,
            top: size.height * 0.8,
            size: 30,
            floatAnim: controller.float3,
          ),
          FloatingLetter(
            letter: '5',
            color: Colors.green,
            left: size.width * 0.6,
            top: size.height * 0.9,
            size: 26,
            floatAnim: controller.float5,
          ),

          // Center logo
          Center(
            child: RotationTransition(
              turns: controller.rotationAnimation,
              child: ScaleTransition(
                scale: controller.scaleAnimation,
                child: Image.asset(
                  AppImage.logo,
                  width: size.width * 0.65,
                  height: size.width * 0.65,
                ),
              ),
            ),
          ),

          // App name & slogan
          Positioned(
            bottom: 140,
            left: 0,
            right: 0,
            child: SplashTexts(
              fadeAnimation: controller.textFadeAnimation,
              nameSlide: controller.nameSlideAnimation,
              sloganSlide: controller.sloganSlideAnimation,
            ),
          ),

          // Bottom dots
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SplashDot(
                  color: const Color(0xFFFF6B6B),
                  delay: 0.0,
                  controller: controller.scaleController,
                ),
                const SizedBox(width: 12),
                SplashDot(
                  color: const Color(0xFF4ECDC4),
                  delay: 0.2,
                  controller: controller.scaleController,
                ),
                const SizedBox(width: 12),
                SplashDot(
                  color: const Color(0xFFFFE66D),
                  delay: 0.4,
                  controller: controller.scaleController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
