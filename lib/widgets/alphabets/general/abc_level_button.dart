import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  final String topText;
  final String heading;
  final String description;
  final Color borderColor;
  final Color shadowColor;
  final double bottomBorderWidth;
  final bool shadow;
  final Color textColor;
  final VoidCallback? onTap;

  const FeatureBox({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    required this.topText,
    required this.heading,
    required this.description,
    required this.borderColor,
    required this.shadowColor,
    required this.textColor,
    this.bottomBorderWidth = 8,
    this.shadow = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(40),
        child: InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: onTap,
          child: Container(
            width: width,
            height: height,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(40),
              border: Border(
                top: BorderSide(width: 1, color: borderColor),
                left: BorderSide(width: 1, color: borderColor),
                right: BorderSide(width: 1, color: borderColor),
                bottom: BorderSide(
                  width: bottomBorderWidth,
                  color: borderColor,
                ),
              ),
              boxShadow: shadow
                  ? [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.45),
                        blurRadius: 16,
                        spreadRadius: 0,
                        offset: const Offset(0, 10),
                      ),
                    ]
                  : [],
            ),
            child: Row(
              children: [
                Image.asset(image, width: 96, height: 112, fit: BoxFit.contain),
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
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
