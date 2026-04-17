import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/constants/app_assets.dart';
import 'package:just_caffe/src/core/navigation/navigator.dart'; // assuming navigator exists
import 'package:just_caffe/src/view/screens/order/order_screen.dart'; // import order screen
import 'package:just_caffe/src/core/extension/context_extension.dart';
import 'widgets/detail_header.dart';
import 'widgets/coffee_image.dart';
import 'widgets/coffee_info.dart';
import 'widgets/coffee_description.dart';
import 'widgets/size_picker.dart';
import 'widgets/detail_footer.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.surfaceColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            DetailHeader(onBack: () => AppNavigator.pop()),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      [
                            SizedBox(height: 16.h),
                            const CoffeeImage(imagePath: ImagePath.coffee4),
                            SizedBox(height: 24.h),
                            const CoffeeInfo(
                              title: "Caffe Mocha",
                              subtitle: "Ice/Hot",
                              rating: 4.8,
                              reviews: 230,
                            ),
                            const CoffeeDescription(
                              description:
                                  "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo..",
                            ),
                            SizedBox(height: 24.h),
                            const SizePicker(),
                            SizedBox(height: 32.h),
                          ]
                          .animate(interval: 100.ms)
                          .fadeIn(duration: 400.ms)
                          .slideY(
                            begin: 0.05,
                            duration: 400.ms,
                            curve: Curves.easeOut,
                          ),
                ),
              ),
            ),
            DetailFooter(
                  price: 4.53,
                  onBuyNow: () {
                    AppNavigator.pushToNextScreen(
                      name: OrderScreen.routeName,
                      child: const OrderScreen(),
                    );
                  },
                )
                .animate()
                .slideY(begin: 1, duration: 600.ms, curve: Curves.easeOut)
                .fadeIn(),
          ],
        ),
      ),
    );
  }
}
