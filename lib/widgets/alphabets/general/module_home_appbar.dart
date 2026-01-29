import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ModuleHomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String heading; 
  final Color bgColor;

  const ModuleHomeAppbar({
    super.key,
    required this.heading,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: preferredSize.height,
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center, // center vertically
          children: [
            ///  LEFT BOX
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
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(9999),
                  border: Border.all(color: Color(0xFFFFFFFF), width: 2),
                ),
                child: Center(
                  child: Icon(
                    Icons.chevron_left,
                    size: 24,
                    color: Color(0xFF334155),
                  ),
                ),
              ),
            ),

            ///  CENTER HEADING
            Expanded(
              child: Center(
                child: Text(
                  heading,
                  style: TextStyle(
                    fontFamily: 'SplineSans',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E293B),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            ///  RIGHT CIRCLE AVATAR with settings icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFFFFF),
                border: Border.all(color: Color(0xFFFFFFFF), width: 2),
              ),
              child: Center(
                child: Icon(Icons.settings, size: 30, color: Color(0xFF334155)),
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
