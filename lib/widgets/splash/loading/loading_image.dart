import 'package:flutter/material.dart';

import '../../../utils/image.dart';

class LoadingImages extends StatelessWidget {
  final Animation<double> yRotation;
  final Animation<double> spinAnimation;
  final Animation<double> scaleAnimation;
  final Animation<double> fadeAnimation;
  final Size size;

  const LoadingImages({
    super.key,
    required this.yRotation,
    required this.spinAnimation,
    required this.scaleAnimation,
    required this.fadeAnimation,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// LEFT ROTATING IMAGE
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, top: 48),
            child: AnimatedBuilder(
              animation: yRotation,
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(yRotation.value),
                  child: child,
                );
              },
              child: Image.asset(AppImage.loadingImg1, width: 42, height: 72),
            ),
          ),
        ),

        const SizedBox(height: 12),

        /// SPINNING IMAGE
        Padding(
          padding: const EdgeInsets.only(left: 278.36),
          child: RotationTransition(
            turns: spinAnimation as Animation<double>,
            child: Image.asset(AppImage.loadingImg2, width: 26, height: 58),
          ),
        ),

        /// CENTER LOGO
        Transform.translate(
          offset: const Offset(0, -30),
          child: FadeTransition(
            opacity: fadeAnimation,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Image.asset(
                AppImage.loadingImg3,
                width: size.width * 0.65,
                height: size.width * 0.65,
              ),
            ),
          ),
        ),

        const SizedBox(height: 24),

        /// BOTTOM ROTATING IMAGE
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: AnimatedBuilder(
              animation: yRotation,
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(yRotation.value),
                  child: child,
                );
              },
              child: Image.asset(AppImage.loadingImg4, width: 42, height: 72),
            ),
          ),
        ),
      ],
    );
  }
}
