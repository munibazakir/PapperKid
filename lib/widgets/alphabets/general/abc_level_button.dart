import 'package:flutter/material.dart';
import '../../../widgets/alphabets/general/feature_inner_content.dart';
import '../../../modules/lock_animation/level_lock.dart';

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
  final bool isLocked;

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
    this.isLocked = false,
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
          onTap: isLocked ? null : onTap,
          child: Container(
            width: width,
            height: height,
            // padding: const EdgeInsets.all(24),
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
                        color: shadowColor,
                        blurRadius: 12,
                        spreadRadius: -4,
                        offset: const Offset(0, 20), // only bottom
                      ),
                    ]
                  : [],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32), // inner radius
              child: LevelLockWrapper(
                isLocked: isLocked,
                blurHeight: 165,
                blurRadius: 32,
                blurAlignment: Alignment.bottomCenter,
                child: FeatureInnerContent(
                  image: image,
                  topText: topText,
                  heading: heading,
                  description: description,
                  textColor: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
