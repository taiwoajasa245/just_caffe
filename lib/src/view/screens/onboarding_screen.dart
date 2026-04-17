import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/constants/app_assets.dart';
import 'package:just_caffe/src/core/extension/num_extension.dart';
import 'package:just_caffe/src/core/navigation/navigator.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/shared/widget/app_button.dart';
import 'package:just_caffe/src/view/widgets/base_view.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff050505),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: .infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagePath.coffee1),
                  fit: .cover,
                ),
              ),
            ),
          ).animate().fadeIn(duration: 1.seconds),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: .topCenter,
                  end: .bottomCenter,
                  colors: [
                    Color(0xff050505).withValues(alpha: 0),
                    Color(0xff050505),
                  ],
                ),
              ),
              child: Padding(
                padding: .symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Text(
                      "Fall in Love with Coffee in Blissful Delight",
                      style: AppTextStyles.body1.copyWith(
                        fontSize: 32.fontSize,
                        fontWeight: .w600,
                        letterSpacing: 0.5,
                        color: Colors.white,
                      ),
                      textAlign: .center,
                    ).animate().slideY(
                      begin: 0.3,
                      duration: 500.ms,
                      curve: Curves.easeOut,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                          "Welcome to our cozy coffee corner, where every cup is a delightful for you.",
                          style: AppTextStyles.body1.copyWith(
                            fontSize: 16.fontSize,
                            fontWeight: .w400,
                            color: Color(0xffA2A2A2),
                          ),
                          textAlign: .center,
                        )
                        .animate()
                        .slideY(
                          begin: 1, // comes from bottom
                          duration: 600.ms,
                          curve: Curves.easeOut,
                        )
                        .fadeIn(duration: 600.ms),
                    SizedBox(height: 32.h),
                    AppPrimaryButton(
                          text: "Get Started",
                          textColor: Colors.white,
                          onTap: () {
                            AppNavigator.pushReplacementToNextScreen(
                              name: BaseView.routeName,
                              child: BaseView(),
                            );
                          },
                        )
                        .animate()
                        .scale(
                          begin: const Offset(5, 5),
                          end: const Offset(1, 1),
                          duration: 500.ms,
                          curve: Curves.elasticOut,
                        )
                        .fadeIn(duration: 300.ms),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
