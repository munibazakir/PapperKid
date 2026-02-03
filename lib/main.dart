import 'package:alphabetsandcounting/model/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app_building.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppBinding.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Splash Screen
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "'Kid's paper",
      home: const SplashScreen(),
    );
  }
}
