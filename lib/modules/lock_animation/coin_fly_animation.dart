import 'package:flutter/material.dart';

class CoinFlyAnimation extends StatefulWidget {
  final Offset start;
  final Offset end;
  final VoidCallback onCompleted;
  final int coinCount; // Number of coins

  const CoinFlyAnimation({
    super.key,
    required this.start,
    required this.end,
    required this.onCompleted,
    this.coinCount = 10, // default 10 coins
  });

  @override
  State<CoinFlyAnimation> createState() => _CoinFlyAnimationState();
}

class _CoinFlyAnimationState extends State<CoinFlyAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late List<Animation<Offset>> coinAnimations;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    // Create staggered animations for each coin
    coinAnimations = List.generate(widget.coinCount, (index) {
      final start = widget.start;
      final end = widget.end;

      // Slight delay for each coin
      final beginInterval = (index * 0.05).clamp(0.0, 0.9);
      final endInterval = (beginInterval + 0.8).clamp(0.0, 1.0);

      return Tween<Offset>(begin: start, end: end).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(beginInterval, endInterval, curve: Curves.easeInOut),
        ),
      );
    });

    controller.forward().whenComplete(widget.onCompleted);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Stack(
          children: List.generate(widget.coinCount, (index) {
            final pos = coinAnimations[index].value;
            return Positioned(
              left: pos.dx - 12,
              top: pos.dy - 12,
              child: Image.asset("assets/images/coin.png", width: 24),
            );
          }),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
