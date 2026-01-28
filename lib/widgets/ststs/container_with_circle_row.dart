import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'circle_with_text.dart';

class ContainerWithCircleRow extends StatelessWidget {
  const ContainerWithCircleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 106,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CircleWithText(
            circleColor: Color(0xFFFFE66D),
            text: "DenCrc",
            hasIcon: false,
            borderColor: Colors.white,
            textColor: Color(0xFF4B5563),
          ),
          CircleWithText(
            circleColor: Color(0xFFFF6B6B),
            text: "arExplore",
            hasIcon: true,
            icon: Iconsax.star,
            borderColor: Colors.white,
            textColor: Color(0xFF4B5563),
          ),
          CircleWithText(
            circleColor: Color(0xFFE5E7EB),
            text: "Lvl 15",
            hasIcon: true,
            icon: Iconsax.lock,
            borderColor: Color(0xFFD1D5DB),
            textColor: Color(0xFF9CA3AF),
          ),
          CircleWithText(
            circleColor: Color(0xFFE5E7EB),
            text: "Lvl 20",
            hasIcon: true,
            icon: Iconsax.lock,
            borderColor: Color(0xFFD1D5DB),
            textColor: Color(0xFF9CA3AF),
          ),
        ],
      ),
    );
  }
}
