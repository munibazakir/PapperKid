import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ElementAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String heading;

  const ElementAppbar({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: preferredSize.height,
      color: const Color(0xFFF5F3DD),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 48, 24, 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// 🔹 LEFT BOX with back action
            GestureDetector(
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  SystemNavigator.pop();
                }
              },
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFF3F4F6), width: 2),
                ),
                child: const Center(
                  child: Icon(
                    Icons.chevron_left,
                    size: 24,
                    color: Color(0xFF374151),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            /// 🔹 CENTER HEADING WITH BOX (responsive)
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 159.234),
                child: Container(
                  height: 52,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD700),
                    borderRadius: BorderRadius.circular(9999),
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: Center(
                    child: Text(
                      heading,
                      style: const TextStyle(
                        fontFamily: 'SplineSans',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1F2937),
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            /// 🔹 RIGHT CIRCLE AVATAR
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Center(
                child: Icon(Icons.settings, size: 24, color: Colors.black),
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
