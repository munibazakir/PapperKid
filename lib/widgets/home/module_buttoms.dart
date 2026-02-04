import 'package:flutter/material.dart';

class ModuleButtoms extends StatelessWidget {
  final Color? bgColor;
  final String heading;
  final String text;
  final IconData icon;
  final Gradient? gradient;
  final VoidCallback onTap;

  const ModuleButtoms({
    super.key,
    this.gradient,
    this.bgColor,
    required this.heading,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(48),
        splashColor: Colors.white.withOpacity(0.2),
        highlightColor: Colors.white.withOpacity(0.05),
        child: Container(
          height: 224,
          width: width - 48, // 24 left + 24 right padding
          decoration: BoxDecoration(
            color: gradient == null ? bgColor : null,
            gradient: gradient,
            borderRadius: BorderRadius.circular(48),
            border: Border.all(color: const Color(0xFFFFFFFF), width: 4),
          ),
          child: Row(
            children: [
              /// LEFT CONTENT (RESPONSIVE)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 36, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        heading,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          fontSize: 36,
                          height: 1,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        text,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'SplineSans',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          height: 1.2,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// RIGHT ICON
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 120,
                    maxHeight: 128,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(88),
                  ),
                  alignment: Alignment.center,
                  child: Icon(icon, color: const Color(0xFFFFFFFF), size: 80),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
