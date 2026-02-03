import 'package:flutter/material.dart';

class CustomCongrtScreen extends StatelessWidget {
  final String headingText;
  final String detailText;
  final String leftText;
  final int rewardCount;
  final VoidCallback onNextLessonPressed;
  final VoidCallback onBackToMapPressed;
  final double progress;

  CustomCongrtScreen({
    super.key,
    required this.headingText,
    required this.detailText,
    required this.leftText,
    required this.rewardCount,
    required this.onNextLessonPressed,
    required this.onBackToMapPressed,
    this.progress = 0.0, // default 0%
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double containerWidth = size.width * 0.9;

    return Scaffold(
      backgroundColor: Color(0xFFFFD166),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 32),
              Center(
                child: Container(
                  width: containerWidth,
                  height: 538,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(48),
                    border: Border.all(width: 4, color: Color(0xFFFFFFFF)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 93,
                        height: 93,
                        child: Image.asset(
                          "assets/images/success.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        headingText,
                        style: TextStyle(
                          fontFamily: "SplineSans",
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF181511),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        detailText,
                        style: TextStyle(
                          fontFamily: "SplineSans",
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xFF5D5B58),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            leftText,
                            style: TextStyle(
                              fontFamily: "SplineSans",
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color(0xFF747370),
                            ),
                          ),

                          // 👇 RIGHT SIDE (Number + Coin)
                          Row(
                            children: [
                              Text(
                                rewardCount.toString(),
                                style: TextStyle(
                                  fontFamily: "SplineSans",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Color(0xFFF4AE34),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Image.asset(
                                "assets/images/coin.png",
                                width: 18,
                                height: 18,
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Color(0xFFE5E7EB),
                          borderRadius: BorderRadius.circular(9999),
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Stack(
                              children: [
                                Container(
                                  width:
                                      constraints.maxWidth *
                                      progress, // dynamic width
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF4AE34), // filled color
                                    borderRadius: BorderRadius.circular(9999),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 16),
                      Text(
                        'Keep going to unlock advanced levels!',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: "SplineSans",
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFA3A1A0),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton.icon(
                              onPressed: onNextLessonPressed, //  callback
                              icon: Icon(
                                Icons.play_arrow,
                                color: Color(0xFF181511),
                                size: 24,
                              ),
                              label: Text(
                                'Next Lesson',
                                style: TextStyle(
                                  fontFamily: "SplineSans",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Color(0xFF181511),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFF4AE34),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton.icon(
                              onPressed: onBackToMapPressed, //  callback
                              icon: Icon(
                                Icons.map,
                                color: Color(0xFF181511),
                                size: 24,
                              ),
                              label: Text(
                                'Back to Map',
                                style: TextStyle(
                                  fontFamily: "SplineSans",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Color(0xFF181511),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFFFFFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                  side: BorderSide(
                                    color: Color(0xFFE5E7EB),
                                    width: 2,
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.copyright, size: 14, color: Color(0xFF000000)),
                  SizedBox(height: 8),
                  Text(
                    'Some text under the container',
                    style: TextStyle(
                      fontFamily: "SplineSans",
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
