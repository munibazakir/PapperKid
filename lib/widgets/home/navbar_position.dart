import 'package:flutter/material.dart';
import '../../model/home/home_screen.dart';
import '../../model/parent/parent_screen.dart';
import '../../model/shop/shop_screen.dart';
import '../../model/stats/stats_screen.dart';
import 'custom_navbar.dart';

class NavbarPosition extends StatelessWidget {
  const NavbarPosition({super.key, required int currentIndex})
    : _currentIndex = currentIndex;

  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == _currentIndex) return;

          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const StatsScreen()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ShopScreen()),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ParentScreen()),
            );
          }
        },
      ),
    );
  }
}
