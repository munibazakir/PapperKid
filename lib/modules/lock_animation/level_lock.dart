import 'dart:ui';
import 'package:flutter/material.dart';

class LevelLockWrapper extends StatelessWidget {
  final bool isLocked;
  final Widget child;

  final double? blurHeight;
  final double blurRadius;
  final Alignment blurAlignment;

  const LevelLockWrapper({
    super.key,
    required this.isLocked,
    required this.child,
    this.blurHeight,
    this.blurRadius = 32,
    this.blurAlignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,

        //  Blur ONLY if height is provided
        if (isLocked && blurHeight != null)
          Positioned.fill(
            child: Align(
              alignment: blurAlignment,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(blurRadius),
                child: SizedBox(
                  height: blurHeight,
                  width: double.infinity,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Container(
                      color: Colors.black.withOpacity(0.05),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.lock,
                        size: 42,
                        color: Color(0xFF3F3F46),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
