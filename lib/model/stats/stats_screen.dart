import 'package:alphabetsandcounting/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../widgets/home/custom_appbar.dart';
import '../../widgets/home/navbar_position.dart';
import '../../widgets/ststs/box_with_circle.dart';
import '../../widgets/ststs/container_with_circle_row.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  int _currentIndex = 1; //  Stats active

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final boxWidth = (screenWidth - 16 * 3) / 2;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F3DE),
      body: Stack(
        children: [
          /// MAIN CONTENT
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(title: "Level 12", subtitle: "Explorer Leo"),

                const SizedBox(height: 16),

                Center(
                  child: Image.asset(
                    AppImage.statsScreen,
                    width: 312,
                    height: 256,
                  ),
                ),

                const SizedBox(height: 12),

                Padding(
                  padding: EdgeInsets.only(left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BoxWithCircle(
                        width: boxWidth,
                        circleColor: const Color(0xFFFFE1E1),
                        circleIcon: Iconsax.medal,
                        heading: "12",
                        subText: "LetterLearned",
                        progress: 0.6,
                        progressColor: const Color(0xFFFF6B6B),
                        iconColor: const Color(0xFFFF6B6B),
                      ),
                      // SizedBox(width: 12),
                      BoxWithCircle(
                        width: boxWidth,
                        circleColor: const Color(0xFFDAE5EB),
                        circleIcon: Iconsax.code,
                        heading: "8",
                        subText: "NumbersMastered",
                        progress: 0.4,
                        progressColor: const Color(0xFF457B9D),
                        iconColor: const Color(0xFF457B9D),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "My Budget",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "SplineSans",
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF374151),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Padding(
                  padding: EdgeInsets.only(left: 24, right: 24),
                  child: ContainerWithCircleRow(),
                ),
              ],
            ),
          ),

          ///  CUSTOM BOTTOM NAV BAR
          NavbarPosition(currentIndex: _currentIndex),
        ],
      ),
    );
  }
}
