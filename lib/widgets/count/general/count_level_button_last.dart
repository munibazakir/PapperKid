import 'package:flutter/material.dart';

import '../../../utils/image.dart';

class CountLevelLastButton extends StatelessWidget {
  const CountLevelLastButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Container(
          width: 225.16,
          height: 147,
          padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
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
              ///  IMAGE + TEXT ROW
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// IMAGE
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      AppImage.countlevel4,
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
                        "Elite",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8B5E34),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Multiplication",
                        style: TextStyle(
                          fontFamily: "SplineSans",
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFFB99E85),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Progress Bar
              Row(
                children: [
                  Text(
                    "Tabels Master",
                    style: TextStyle(
                      fontFamily: "SplineSans",
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFF4AE34),
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    height: 8,
                    width: 95.16,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(9999),
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Stack(
                          children: [
                            Container(
                              width: constraints.maxWidth * 0.5,
                              decoration: BoxDecoration(
                                color: Color(0xFFF4AE34),
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
            ],
          ),
        ),
      ),
    );
  }
}
