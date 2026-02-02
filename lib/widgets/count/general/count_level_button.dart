import 'package:flutter/material.dart';

class CountLevelButton extends StatelessWidget {
  final Color tagColor;
  final String tagText;
  final String heading;
  final String description;
  final String imagePath;
  final double progress; // 0.0 – 1.0
  final Color progressColor;
  final Color descriptionColor;
  final VoidCallback onTap;

  const CountLevelButton({
    super.key,
    required this.tagColor,
    required this.tagText,
    required this.heading,
    required this.description,
    required this.imagePath,
    required this.progress,
    required this.progressColor,
    required this.descriptionColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Container(
            width: width,
            height: 136,
            padding: const EdgeInsets.only(left: 24, right: 24, top: 10),
            decoration: BoxDecoration(
              color: Color(0xFFDBBC97),
              borderRadius: BorderRadius.circular(24),
              border: Border(
                bottom: BorderSide(width: 9, color: Color(0xFFB89060)),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///  TOP TAG
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 24,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: tagColor,
                      borderRadius: BorderRadius.circular(9999),
                    ),
                    child: Text(
                      tagText,
                      style: const TextStyle(
                        fontFamily: "SplineSans",
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                ///  IMAGE + TEXT ROW
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// IMAGE
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        imagePath,
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 12),

                    /// TEXT COLUMN
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          heading,
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF8B5E34),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          style: TextStyle(
                            fontFamily: "SplineSans",
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: descriptionColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Progress Bar
                Container(
                  height: 8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Stack(
                        children: [
                          Container(
                            width: constraints.maxWidth * progress,
                            decoration: BoxDecoration(
                              color: progressColor,
                              borderRadius: BorderRadius.circular(9999),
                            ),
                          ),
                        ],
                      );
                    },
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
