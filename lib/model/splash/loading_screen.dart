import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/loading/loading_conroller.dart';
import '../../widgets/splash/loading/loading_image.dart';
import '../../widgets/splash/loading/progress_box.dart';
import '../../widgets/splash/loading/progress_persentage.dart';
import '../../widgets/splash/loading/box_color.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoadingController controller = Get.put(LoadingController());
    final size = MediaQuery.of(context).size;

    final double barWidth = size.width * 0.85 > 311 ? 311 : size.width * 0.85;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F3DD),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LoadingImages(
                yRotation: controller.yRotation,
                spinAnimation: controller.spinController,
                scaleAnimation: controller.scaleAnimation,
                fadeAnimation: controller.fadeAnimation,
                size: size,
              ),

              Obx(
                () => ProgressBox(
                  barWidth: barWidth,
                  activeIndex: controller.activeIndex.value,
                  boxColors: boxColors,
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Building the world....',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Color(0xFF374151),
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  height: 1,
                ),
              ),

              const SizedBox(height: 8),

              Obx(
                () => ProgressPersentage(
                  activeIndex: controller.activeIndex.value,
                  progress: controller.progress,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
