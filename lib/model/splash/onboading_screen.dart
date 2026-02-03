import 'package:alphabetsandcounting/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/onboarding/onboarding_controller.dart';
import '../../widgets/splash/onboarding/onboardpage.dart';
import '../../widgets/splash/onboarding/top_skip_text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// PAGE VIEW
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: [
              // Onboarding Screen 1
              OnboardPage(
                image: AppImage.onboarding1,
                title: 'Explore the',
                highlight: 'Alphabet Forest!',
                highlightColor: const Color(0xFF2D6A4F),
                description: 'Learn letters through fun 3D games and sounds.',
                index: 0,
                buttonText: 'Next',
                // onPressed: controller.nextPage,
                showDots: true,
                containerColor: Colors.white,
                btnColor: const Color(0xFFFF6B6B),
                bgColor: const Color(0xFFF7F3DE),
              ),

              // Onboarding Screen 2
              OnboardPage(
                image: AppImage.onboarding2,
                title: 'Climb',
                highlight: 'Number Mountain!',
                highlightColor: const Color(0xFF457B9D),
                description:
                    'Master counting and multiplication with interactive 3D puzzles.',
                index: 1,
                buttonText: 'Next Level',
                // onPressed: controller.nextPage,
                showDots: true,
                containerColor: Colors.transparent,
                btnColor: const Color(0xFF457B9D),
                bgColor: Colors.white,
              ),

              // Onboarding Screen 3
              OnboardPage(
                image: AppImage.onboarding3,
                title: 'Earn Awesome',
                highlight: 'Rewards!',
                highlightColor: const Color(0xFFFF6B6B),
                description: 'Let’s begin the journey',
                index: 2,
                buttonText: 'Get Started',
                // onPressed: controller.nextPage,
                showDots: false,
                containerColor: Colors.transparent,
                btnColor: const Color(0xFFFF6B6B),
                bgColor: const Color(0xFFF7F3DE),
              ),
            ],
          ),

          /// SKIP
          Positioned(
            top: 50,
            right: 24,
            child: GestureDetector(
              onTap: controller.skip,
              child: const TopSkipText(),
            ),
          ),
        ],
      ),
    );
  }
}
