import 'package:flutter/material.dart';

class CircleWithText extends StatelessWidget {
  final Color circleColor;
  final String text;
  final bool hasIcon;
  final IconData? icon;
  final Color borderColor;
  final Color textColor;

  const CircleWithText({
    super.key,
    required this.circleColor,
    required this.text,
    this.hasIcon = true,
    this.icon,
    required this.borderColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //  Circle
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: circleColor,
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: 2),
          ),
          child: hasIcon && icon != null
              ? Center(child: Icon(icon, color: Colors.white, size: 24))
              : null,
        ),

        const SizedBox(height: 8),

        //  Text
        Flexible(
          child: SizedBox(
            width: 56, // optional fixed width
            child: Text(
              text,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "SplineSans",
                color: textColor,
                fontSize: 9,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
