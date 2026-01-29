import 'package:alphabetsandcounting/utils/image.dart';
import 'package:flutter/material.dart';

import '../../widgets/splash/onboarding/onboardpage.dart';
import '../../widgets/splash/onboarding/top_skip_text.dart';
import '../home/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  void nextPage() {
    if (currentIndex < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          /// PAGE VIEW
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            children: [
              // Onboarding Screen 1
              OnboardPage(
                image: AppImage.onboarding1,
                title: 'Explore the',
                highlight: 'Alphabet Forest!',
                highlightColor: Color(0xFF2D6A4F),
                description: 'Learn letters through fun 3D games and sounds.',
                index: 0,
                buttonText: 'Next',
                onPressed: nextPage,
                showDots: true,
                containerColor: Colors.white,
                btnColor: Color(0xFFFF6B6B),
              ),

              // Onboarding Screen 2
              OnboardPage(
                image: AppImage.onboarding2,
                title: 'Climb',
                highlight: 'Number Mountain!',
                highlightColor: Color(0xFF457B9D),
                description:
                    'Master counting and multiplication with interactive 3D puzzles.',
                index: 1,
                buttonText: 'Next Level',
                onPressed: nextPage,
                showDots: true,
                containerColor: Colors.transparent,
                btnColor: Color(0xFF457B9D),
              ),

              // Onboarding Screen 3
              OnboardPage(
                image: AppImage.onboarding3,
                title: 'Earn Awesome',
                highlight: 'Rewards!',
                highlightColor: Color(0xFFFF6B6B),
                description: 'Let’s begin the journey',
                index: 2,
                buttonText: 'Get Started',
                onPressed: nextPage,
                showDots: false,
                containerColor: Colors.transparent,
                btnColor: Color(0xFFFF6B6B),
              ),
            ],
          ),

          /// SKIP
          TopSkipText(),
        ],
      ),
    );
  }
}
