import 'package:flutter/material.dart';

class FeatureInnerContent extends StatelessWidget {
  final String image;
  final String topText;
  final String heading;
  final String description;
  final Color textColor;

  const FeatureInnerContent({
    required this.image,
    required this.topText,
    required this.heading,
    required this.description,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Image.asset(image, width: 96, height: 112),
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
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  heading,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
