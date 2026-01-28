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
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Color(0xFFFEDEC4),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
      child: Row(
        children: [
          /// 🔹 Left Image
          Image.asset(imagePath, width: 96, height: 112, fit: BoxFit.contain),
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
    );
  }
}
