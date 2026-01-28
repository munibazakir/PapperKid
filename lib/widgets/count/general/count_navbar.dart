import 'package:flutter/material.dart';

class CountButtomNavbar extends StatelessWidget {
  const CountButtomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Container(
          height: 112,
          padding: const EdgeInsets.symmetric(vertical: 16),
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// CONTINUE BUTTON (Responsive)
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 64,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4AE34),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.play_arrow, color: Colors.white, size: 24),
                        SizedBox(width: 8),
                        Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// SETTINGS BOX
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFE3C9A6),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.settings,
                    size: 24,
                    color: Color(0xFF8B5E34),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
