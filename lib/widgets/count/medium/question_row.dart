import 'package:flutter/material.dart';

class MathQuestionRow extends StatelessWidget {
  final int firstNumber;
  final int secondNumber;
  final String sign;

  const MathQuestionRow({
    super.key,
    required this.firstNumber,
    required this.secondNumber,
    required this.sign,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle bigText = TextStyle(
      fontFamily: "SplineSans",
      fontSize: 60,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      height: 1,
    );

    const TextStyle signText = TextStyle(
      fontFamily: "SplineSans",
      fontSize: 36,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      height: 1,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(firstNumber.toString(), style: bigText),
                const SizedBox(width: 8),
                Text(sign, style: signText),
                const SizedBox(width: 8),
                Text(secondNumber.toString(), style: bigText),
                const SizedBox(width: 8),
                const Text("=", style: bigText),
                const SizedBox(width: 8),
                _questionBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _questionBox() {
    return Container(
      width: 72,
      height: 72,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF27272A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF9D699), width: 2),
      ),
      child: const Text(
        "?",
        style: TextStyle(
          fontFamily: "SplineSans",
          fontSize: 60,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          height: 1,
        ),
      ),
    );
  }
}
