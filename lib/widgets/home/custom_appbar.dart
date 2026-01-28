import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;

  const CustomAppBar({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: preferredSize.height,
      color: Color(0xFFF7F3DE),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 48, 24, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 LEFT BOX + Text
            Row(
              children: [
                /// Box with logo
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color(0xFFFF6B6B), width: 2),
                  ),
                  child: Center(
                    child: Icon(Icons.face, size: 30, color: Color(0xFFFF6B6B)),
                  ),
                ),

                const SizedBox(width: 12),

                /// Level Name + Person Name
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF9CA3AF),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontFamily: "SplineSans",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            /// 🔹 RIGHT CIRCLE AVATAR with settings icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFE66D),
                border: Border.all(color: Color(0xFFFFFFFF), width: 2),
              ),
              child: Center(
                child: Icon(Icons.settings, size: 30, color: Color(0xFF1F2937)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(112);
}
