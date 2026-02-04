import 'dart:ui';
import 'package:alphabetsandcounting/utils/image.dart';
import 'package:flutter/material.dart';
import '../home/home_screen.dart';

class ParentScreen extends StatelessWidget {
  const ParentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF5F3DD),
      body: Stack(
        children: [
          ///  Background Image
          Positioned(
            right: -size.width * 0.15,
            top: size.height * 0.15,
            child: Image.asset(
              AppImage.parentImage,
              width: size.width * 0.7,
              fit: BoxFit.contain,
            ),
          ),

          ///  Blur Layer
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(color: Colors.transparent),
          ),

          ///  Main Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 32, right: 32, top: 48),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const HomeScreen(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.chevron_left,
                            size: 24,
                            color: Color(0xFF9CA3AF),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  /// Center Card
                  Center(
                    child: Container(
                      width: size.width * 0.85,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: Color(0xFFFFFFFF), width: 2),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /// Icon Box
                          Container(
                            width: 88,
                            height: 88,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFE66D),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: Color(0xFFFFFFFF),
                                width: 4,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.family_restroom,
                                size: 48,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          /// Heading
                          Text(
                            "Parents",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w700,
                              fontSize: 36,
                              color: Color(0xFF1F2937),
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            "Only",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w700,
                              fontSize: 36,
                              color: Color(0xFF1F2937),
                            ),
                          ),

                          const SizedBox(height: 48),

                          /// Description
                          Text(
                            "Welcome! Please sign in to verify your age and access settings.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "SplineSans",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xFF6B7280),
                            ),
                          ),

                          const SizedBox(height: 16),

                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFFFFFF),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        "assets/images/google.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        "Sign in with Google",
                                        style: TextStyle(
                                          fontFamily: "SplineSans",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF374151),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
