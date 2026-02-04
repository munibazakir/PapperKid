import 'package:alphabetsandcounting/modules/lock_animation/level_lock.dart';
import 'package:flutter/material.dart';

class LastFeatureBox extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final String topText;
  final String heading;
  final String description;

  const LastFeatureBox({
    super.key,
    required this.width,
    required this.height,
    required this.imagePath,
    required this.topText,
    required this.heading,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: LevelLockWrapper(
        isLocked: true,
        blurHeight: 185,
        blurRadius: 32,
        blurAlignment: Alignment.bottomCenter,
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Color(0xFFFEDEC4),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Row(
            children: [
              ///  Left Image
              Image.asset(
                imagePath,
                width: 96,
                height: 112,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 24),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      topText,
                      style: TextStyle(
                        fontFamily: "SplineSans",
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFB923C),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      heading,
                      style: TextStyle(
                        fontFamily: "SplineSans",
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontFamily: "SplineSans",
                        color: Color(0xFF64748B),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
