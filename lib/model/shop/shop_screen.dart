import 'package:flutter/material.dart';
import '../../widgets/home/navbar_position.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int _currentIndex = 2; // Shop tab active

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// MAIN CONTENT
          SafeArea(
            child: Center(
              child: Text(
                "Shop Screen",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          ///  CUSTOM BOTTOM NAV BAR
          NavbarPosition(currentIndex: _currentIndex),
        ],
      ),
    );
  }
}
