import 'package:flutter/material.dart';

class AlphabetsQuizOptions extends StatelessWidget {
  const AlphabetsQuizOptions({
    super.key,
    required this.current,
    required this.onNext,
  });

  final Map<String, dynamic> current;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// First Option (left, slightly lower)
          Positioned(
            left: 0,
            bottom: -5,
            child: GestureDetector(
              onTap: () {
                if (current['quizOptions'][0]['isCorrect']) {
                  onNext();
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Wrong answer! Try again")),
                  );
                }
              },
              child: Transform.rotate(
                angle: -(16.15 * 3.141592653589793 / 180), // rotation
                child: Container(
                  width: 112,
                  height: 128,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF72585),
                    borderRadius: BorderRadius.circular(5040),
                    border: const Border(
                      bottom: BorderSide(width: 8, color: Color(0xFFE6E6E6)),
                      right: BorderSide(width: 8, color: Color(0xFFE6E6E6)),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      current['quizOptions'][0]['text'],
                      style: const TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w900,
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          /// Second Option (center, slightly upper)
          Positioned(
            bottom: 9,
            child: GestureDetector(
              onTap: () {
                if (current['quizOptions'][1]['isCorrect']) {
                  onNext();
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Wrong answer! Try again")),
                  );
                }
              },
              child: Container(
                width: 128,
                height: 144,
                decoration: BoxDecoration(
                  color: const Color(0xFF4CC9F0),
                  borderRadius: BorderRadius.circular(5040),
                  border: const Border(
                    bottom: BorderSide(width: 8, color: Color(0xFFE6E6E6)),
                    right: BorderSide(width: 8, color: Color(0xFFE6E6E6)),
                  ),
                ),
                child: Center(
                  child: Text(
                    current['quizOptions'][1]['text'],
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w900,
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),

          /// Third Option (right, slightly lower)
          Positioned(
            right: 0,
            bottom: -5,
            child: GestureDetector(
              onTap: () {
                if (current['quizOptions'][2]['isCorrect']) {
                  onNext();
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Wrong answer! Try again")),
                  );
                }
              },
              child: Transform.rotate(
                angle: 16.15 * 3.141592653589793 / 180,
                child: Container(
                  width: 112,
                  height: 128,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4ADE80),
                    borderRadius: BorderRadius.circular(5040),
                    border: const Border(
                      bottom: BorderSide(width: 8, color: Color(0xFFE6E6E6)),
                      right: BorderSide(width: 8, color: Color(0xFFE6E6E6)),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      current['quizOptions'][2]['text'],
                      style: const TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w900,
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
