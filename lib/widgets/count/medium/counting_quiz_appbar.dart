import 'package:flutter/material.dart';

class CountQuizAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CountQuizAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: preferredSize.height,
      color: Color(0xFFE0F2FE),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center, // center vertically
          children: [
            ///  LEFT BOX
            GestureDetector(
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context); // previous screen pe wapas
                }
              },
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(9999),
                  border: const Border(
                    bottom: BorderSide(color: Color(0xFFE4E4E7), width: 4),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.chevron_left,
                    size: 24,
                    color: Color(0xFF4A90E2),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16), // spacing
            ///  CENTER HEADING WITH BOX
            Container(
              width: 159.234, // exact width
              height: 52,
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(9999),
                border: Border(
                  bottom: BorderSide(color: Color(0xFFE4E4E7), width: 4),
                ),
              ),
              child: Center(
                child: Text(
                  "Quiz Time",
                  style: TextStyle(
                    fontFamily: 'SplineSans',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF374151), // change if needed
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(width: 16),
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(9999),
                border: const Border(
                  bottom: BorderSide(color: Color(0xFFE4E4E7), width: 4),
                ),
              ),
              child: Center(
                child: Icon(Icons.settings, size: 24, color: Color(0xFF4A90E2)),
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
