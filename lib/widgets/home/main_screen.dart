// import 'package:flutter/material.dart';
// import '../../model/home/home_screen.dart';
// import '../../model/parent/parent_screen.dart';
// import '../../model/shop/shop_screen.dart';
// import '../../model/stats/stats_screen.dart';
// import 'custom_navbar.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _currentIndex = 0;

//   final List<Widget> _screens = const [
//     HomeScreen(),
//     StatsScreen(),
//     ShopScreen(),
//     ParentScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           /// 🔥 Screens switch yahan hoga
//           IndexedStack(index: _currentIndex, children: _screens),

//           /// 🔥 Custom Bottom Nav
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: CustomBottomNav(
//               currentIndex: _currentIndex,
//               onTap: (index) {
//                 setState(() {
//                   _currentIndex = index;
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
