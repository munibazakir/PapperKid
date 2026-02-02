import 'package:flutter/material.dart';
import 'dots_row.dart';

class OnboardPage extends StatefulWidget {
  final String image;
  final String title;
  final String highlight;
  final Color highlightColor;
  final String description;
  final int index;
  final String buttonText;
  final VoidCallback onPressed;
  final bool showDots;
  final Color containerColor;
  final Color btnColor;
  final Color bgColor;

  const OnboardPage({
    super.key,
    required this.image,
    required this.title,
    required this.highlight,
    required this.highlightColor,
    required this.description,
    required this.index,
    required this.buttonText,
    required this.onPressed,
    required this.showDots,
    required this.containerColor,
    required this.btnColor,
    required this.bgColor,
  });

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Offset> _titleAnimation;
  late Animation<Offset> _highlightAnimation;
  late Animation<Offset> _descAnimation;

  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();

    _titleAnimation =
        Tween<Offset>(
          begin: const Offset(0, -1.5), // top → center (1.5× height)
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.5, curve: Curves.easeOutBack),
          ),
        );

    _highlightAnimation =
        Tween<Offset>(
          begin: const Offset(0.5, 0), // right → center
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.3, 0.7, curve: Curves.easeOut),
          ),
        );

    _descAnimation =
        Tween<Offset>(
          begin: const Offset(0, 0.6), // bottom → up
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
          ),
        );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: widget.bgColor,

      /// FIXED BUTTON AT BOTTOM
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: SizedBox(
          height: 64,
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.btnColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              widget.buttonText,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              /// IMAGE
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Image.asset(
                  widget.image,
                  width: size.width * 0.9,
                  height: 320,
                  fit: BoxFit.contain,
                ),
              ),

              /// CONTAINER
              Container(
                width: 312,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 16,
                  bottom: 24,
                ),
                decoration: BoxDecoration(
                  color: widget.containerColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _titleAnimation,
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                            height: 1,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _highlightAnimation,
                        child: Text(
                          widget.highlight,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                            height: 1,
                            color: widget.highlightColor,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _descAnimation,
                        child: Text(
                          widget.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'SplineSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            height: 1,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    if (widget.showDots) DotsRow(index: widget.index),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
