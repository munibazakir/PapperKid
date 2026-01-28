import 'package:flutter/material.dart';

import 'dots_row.dart';

class OnboardPage extends StatelessWidget {
  final String image;
  final String title;
  final String highlight;
  final Color highlightColor;
  final String description;
  final int index;
  final String buttonText;
  final VoidCallback onPressed;
  final bool showDots;
  final Color containerColor;
  final Color btnColor;

  const OnboardPage({
    required this.image,
    required this.title,
    required this.highlight,
    required this.highlightColor,
    required this.description,
    required this.index,
    required this.buttonText,
    required this.onPressed,
    required this.showDots,
    required this.containerColor,
    required this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      ///  FIXED BUTTON AT BOTTOM
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: SizedBox(
          height: 64,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: btnColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// IMAGE
                      Image.asset(
                        image,
                        width: size.width * 0.9,
                        height: 320,
                        fit: BoxFit.contain,
                      ),

                      /// CONTAINER
                      Container(
                        width: 312,
                        height: MediaQuery.of(context).size.height,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: containerColor,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Column(
                          children: [
                            Text(
                              title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                height: 1,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              highlight,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 32,
                                height: 1,
                                color: highlightColor,
                              ),
                            ),

                            const SizedBox(height: 12),

                            Text(
                              description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'SplineSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                height: 1,
                                color: Color(0xFF6B7280),
                              ),
                            ),

                            const SizedBox(height: 24),

                            if (showDots) DotsRow(index: index),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
