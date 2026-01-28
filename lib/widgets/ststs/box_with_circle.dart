import 'package:flutter/material.dart';

class BoxWithCircle extends StatelessWidget {
  final double width;
  final Color circleColor;
  final IconData circleIcon;
  final String heading;
  final String subText;
  final double progress; // 0.0 to 1.0
  final Color progressColor;
  final Color iconColor;

  const BoxWithCircle({
    super.key,
    required this.width,
    required this.circleColor,
    required this.circleIcon,
    required this.heading,
    required this.subText,
    required this.progress,
    required this.progressColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: const Color(0xFFE5E7EB), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //  Circle Icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: circleColor,
              shape: BoxShape.circle,
            ),
            child: Center(child: Icon(circleIcon, color: iconColor, size: 24)),
          ),

          const SizedBox(height: 12),

          //  Heading
          Text(
            heading,
            style: const TextStyle(
              fontSize: 36,
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              color: Color(0xFF1F2937),
            ),
          ),

          const SizedBox(height: 4),

          //  Sub Text
          Text(
            subText,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: "SplineSans",
              fontWeight: FontWeight.w400,
              color: Color(0xFF6B7280),
            ),
          ),

          const SizedBox(height: 12),

          //  Progress Bar
          Container(
            width: double.infinity,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(9999),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress.clamp(0.0, 1.0),
              child: Container(
                decoration: BoxDecoration(
                  color: progressColor,
                  borderRadius: BorderRadius.circular(9999),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
