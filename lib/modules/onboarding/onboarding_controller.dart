import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/home/home_screen.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentIndex = 0.obs;

  void nextPage() {
    if (currentIndex.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

  void skip() {
    Get.offAll(() => const HomeScreen());
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }
}
