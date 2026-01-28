import 'package:flutter/material.dart';

class PlaySoundButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PlaySoundButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: screenWidth * 0.9, // responsive width
          height: 88,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          decoration: BoxDecoration(
            color: const Color(0xFFFF4B4B), // button background
            borderRadius: BorderRadius.circular(24),
            border: Border(
              bottom: BorderSide(
                color: const Color(0xFFB91C1C), // bottom border color
                width: 8,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              /// ICON
              Icon(Icons.volume_up, size: 36, color: Colors.white),

              SizedBox(width: 12), // gap 12px
              /// TEXT
              Text(
                "Play Sound",
                style: TextStyle(
                  fontFamily: "SplineSans",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
