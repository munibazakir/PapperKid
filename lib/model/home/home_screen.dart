import 'package:flutter/material.dart';
import '../../widgets/home/custom_appbar.dart';
import '../../widgets/home/module_buttoms.dart';
import '../../widgets/home/navbar_position.dart';
import '../alphabets_module/abc_level_screen.dart';
import '../counting_module/count_level_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;

  late final AnimationController _controller1;
  late final Animation<Offset> _slideAnimation1;

  late final AnimationController _controller2;
  late final Animation<Offset> _slideAnimation2;

  @override
  void initState() {
    super.initState();

    ///  Module 1 Animation
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _slideAnimation1 = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller1, curve: Curves.easeOut));

    ///  Module 2 Animation
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _slideAnimation2 = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller2, curve: Curves.easeOut));

    /// Start animations after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller1.forward();
      Future.delayed(const Duration(milliseconds: 200), () {
        _controller2.forward();
      });
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3DD),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomAppBar(title: "Level 12", subtitle: "Explorer Leo"),
                const SizedBox(height: 24),

                ///  Module 1 Slide
                AnimatedBuilder(
                  animation: _controller1,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _controller1.value,
                      child: SlideTransition(
                        position: _slideAnimation1,
                        child: child,
                      ),
                    );
                  },
                  child: ModuleButtoms(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFF178B42), Color(0xFF21BE5A)],
                    ),
                    heading: "ABC",
                    text: "Alphabets Forest",
                    icon: Icons.park,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AbcLevelScreen()),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),

                ///  Module 2 Slide
                AnimatedBuilder(
                  animation: _controller2,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _controller2.value,
                      child: SlideTransition(
                        position: _slideAnimation2,
                        child: child,
                      ),
                    );
                  },
                  child: ModuleButtoms(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFF2053DB), Color(0xFF397EF4)],
                    ),
                    heading: "123",
                    text: "Number Mountain",
                    icon: Icons.terrain,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => CountLevelScreen()),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),

          NavbarPosition(currentIndex: _currentIndex),
        ],
      ),
    );
  }
}
