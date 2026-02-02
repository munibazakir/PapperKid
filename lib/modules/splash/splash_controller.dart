import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/splash/loading_screen.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  // Animation controllers
  late AnimationController scaleController;
  late AnimationController onceController;

  // Animations
  late Animation<double> scaleAnimation;
  late Animation<double> rotationAnimation;
  late Animation<double> floatA;
  late Animation<double> floatB;
  late Animation<double> float3;
  late Animation<double> float5;

  late Animation<double> textFadeAnimation;
  late Animation<Offset> nameSlideAnimation;
  late Animation<Offset> sloganSlideAnimation;

  @override
  void onInit() {
    super.onInit();

    // Continuous animations
    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: scaleController, curve: Curves.easeInOut),
    );

    rotationAnimation = Tween<double>(begin: -0.03, end: 0.03).animate(
      CurvedAnimation(parent: scaleController, curve: Curves.easeInOut),
    );

    floatA = Tween<double>(begin: 0, end: 15).animate(scaleController);
    floatB = Tween<double>(begin: 0, end: -15).animate(scaleController);
    float3 = Tween<double>(begin: 0, end: 10).animate(scaleController);
    float5 = Tween<double>(begin: 0, end: -10).animate(scaleController);

    // One-time animations
    onceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    textFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: onceController, curve: Curves.easeIn));

    nameSlideAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: onceController, curve: Curves.easeOut));

    sloganSlideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: onceController, curve: Curves.easeOut));

    // Navigate to next screen
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(() => const LoadingScreen());
    });
  }

  @override
  void onClose() {
    scaleController.dispose();
    onceController.dispose();
    super.onClose();
  }
}
