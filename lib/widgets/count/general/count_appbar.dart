import 'package:flutter/material.dart';

class CountAppBar extends StatelessWidget {
  final VoidCallback? onBackTap;
  final VoidCallback? onStarTap;

  const CountAppBar({super.key, this.onBackTap, this.onStarTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 112,
      padding: const EdgeInsets.only(top: 48, left: 14, right: 14, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///  LEFT BOX (Back)
          GestureDetector(
            onTap: onBackTap ?? () => Navigator.pop(context),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 2, color: Color(0xFFE3C9A6)),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: Color(0xFF8B5E34),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),

          ///  CENTER TEXT
          Expanded(
            child: Center(
              child: Text(
                "Number Islands",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "SplineSans",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF8B5E34),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),

          ///  RIGHT BOX (Star)
          GestureDetector(
            onTap: onStarTap,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 2, color: Color(0xFFE3C9A6)),
              ),
              child: Center(
                child: Icon(Icons.star, size: 24, color: Color(0xFFF4AE34)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
