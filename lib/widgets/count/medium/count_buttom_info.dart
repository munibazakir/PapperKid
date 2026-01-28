import 'package:flutter/material.dart';

class CountButtomInfo extends StatelessWidget {
  const CountButtomInfo({super.key, required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9999),
        child: LinearProgressIndicator(
          value: progress,
          minHeight: 16,
          backgroundColor: Colors.grey.shade300,
        ),
      ),
    );
  }
}
