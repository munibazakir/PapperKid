import 'package:alphabetsandcounting/model/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'modules/controller/progress_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  Get.put(ProgressController(prefs)); // put globally

  runApp(MyApp());
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
