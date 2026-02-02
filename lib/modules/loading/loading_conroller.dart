import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/splash/onboading_screen.dart';

class LoadingController extends GetxController
    with GetTickerProviderStateMixin {
  // Animation Controllers
  late AnimationController spinController;
  late AnimationController yController;
  late AnimationController logoController;

  // Animations
  late Animation<double> yRotation;
  late Animation<double> scaleAnimation;
  late Animation<double> fadeAnimation;

  // Progress
  var activeIndex = 0.obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();

    // Spin controller
    spinController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    // Y-axis rotation
    yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    yRotation = Tween<double>(
      begin: 0,
      end: 3.1416,
    ).animate(CurvedAnimation(parent: yController, curve: Curves.easeInOut));
    yController.repeat(reverse: true);

    // Logo animation
    logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..forward();

    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: logoController, curve: Curves.easeOutBack),
    );

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: logoController, curve: Curves.easeIn));

    // Progress timer
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (activeIndex.value < 7) {
        activeIndex.value++;
      } else {
        timer.cancel();
        Future.delayed(const Duration(milliseconds: 500), () {
          Get.off(() => const OnboardingScreen());
        });
      }
    });
  }

  @override
  void onClose() {
    spinController.dispose();
    yController.dispose();
    logoController.dispose();
    timer?.cancel();
    super.onClose();
  }

  double get progress => ((activeIndex.value + 1) / 8) * 100;
}
