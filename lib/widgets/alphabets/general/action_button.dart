import 'package:flutter/material.dart';

class ActionBox extends StatelessWidget {
  final double height;
  final String image;
  final String text;

  const ActionBox({
    super.key,
    this.height = 48, // optional default height
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          width: 1,
          color: Color(0xFFFFFFFF),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // 🔥 content-based width
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              fontFamily: "SplineSans",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF334155
),
            ),
          ),
        ],
      ),
    );
  }
}
