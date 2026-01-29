import 'dart:async';
import 'package:alphabetsandcounting/model/splash/onboading_screen.dart';
import 'package:alphabetsandcounting/utils/image.dart';
import 'package:alphabetsandcounting/widgets/splash/loading/progress_box.dart';
import 'package:flutter/material.dart';
import '../../widgets/splash/loading/box_color.dart';
import '../../widgets/splash/loading/progress_persentage.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController _spinController;
  late AnimationController _yController;
  late Animation<double> _animation;
  int activeIndex = -1;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    // image spin Animation
    _spinController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); //  infinite spin

    // Y-axis rotation Animation
    _yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Second animation
    _animation = Tween<double>(
      begin: 0,
      end: 3.1416, //  180 degree
    ).animate(CurvedAnimation(parent: _yController, curve: Curves.easeInOut));

    _yController.repeat(reverse: true);

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (activeIndex < 7) {
        setState(() {
          activeIndex++;
        });
      } else {
        timer.cancel();

        /// wait a little & move to onboarding
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const OnboardingScreen()),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _spinController.dispose();
    _yController.dispose();
    timer?.cancel();
    super.dispose();
  }

  double get progress => ((activeIndex + 1) / 8) * 100;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final double barWidth = size.width * 0.85 > 311 ? 311 : size.width * 0.85;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F3DD),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// IMAGE
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 24, top: 48),
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001) //  perspective
                          ..rotateY(_animation.value),
                        child: child,
                      );
                    },
                    child: Image.asset(
                      AppImage.loadingImg1,
                      width: 42,
                      height: 72,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 12, left: 278.36),
                child: RotationTransition(
                  turns: _spinController,
                  child: Image.asset(
                    AppImage.loadingImg2,
                    width: 26,
                    height: 58,
                  ),
                ),
              ),

              Transform.translate(
                offset: Offset(0, -30),
                child: Image.asset(
                  AppImage.loadingImg3,
                  width: 288,
                  height: 288,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 24),

              ProgressBox(
                barWidth: barWidth,
                activeIndex: activeIndex,
                boxColors: boxColors,
              ),

              const SizedBox(height: 24),

              /// HEADING
              const Text(
                'Buinding the world....',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Color(0xFF374151),
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  height: 1,
                ),
              ),

              const SizedBox(height: 8),

              /// DESCRIPTION
              ProgressPersentage(activeIndex: activeIndex, progress: progress),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001) //  perspective
                          ..rotateY(_animation.value),
                        child: child,
                      );
                    },
                    child: Image.asset(
                      AppImage.loadingImg4,
                      width: 42,
                      height: 72,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
