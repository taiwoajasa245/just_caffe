import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/constants/app_assets.dart';
import 'package:just_caffe/src/core/extension/num_extension.dart';
import 'package:just_caffe/src/core/navigation/navigator.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/view/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(3.seconds, () {
      AppNavigator.pushReplacementToNextScreen(
        name: OnboardingScreen.routeName,
        child: OnboardingScreen(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff050505),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(ImagePath.coffee1, height: 600.h)
                .animate()
                .fadeIn(duration: 800.ms)
                .scale(begin: const Offset(0.8, 0.8), curve: Curves.easeOut),

            SizedBox(height: 16.h),
            Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: .circle,
                    border: .all(
                      color: Colors.white.withValues(alpha: .2),
                      width: 3,
                    ),
                  ),
                  child: Align(
                    alignment: .topCenter,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: .circle,
                      ),
                    ),
                  ),
                )
                .animate(onPlay: (controller) => controller.repeat())
                .rotate(duration: 1.seconds),
            SizedBox(height: 16.h),
            Text(
                  "Just Caffe",
                  style: AppTextStyles.body1.copyWith(
                    fontSize: 28.fontSize,
                    fontWeight: .w600,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                )
                .animate(delay: 300.ms)
                .fadeIn(duration: 600.ms)
                .slideY(begin: 0.5),

            SizedBox(height: 8.h),

            Text(
              "Brewed for you",
              style: AppTextStyles.body1.copyWith(
                fontSize: 14.fontSize,
                color: const Color(0xffA2A2A2),
              ),
            ).animate(delay: 500.ms).fadeIn(duration: 600.ms),
          ],
        ),
      ),
    );
  }
}
