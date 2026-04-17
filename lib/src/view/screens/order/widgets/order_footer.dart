import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/constants/app_assets.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';
import 'package:just_caffe/src/shared/widget/app_button.dart';
import 'package:just_caffe/src/core/navigation/navigator.dart';
import 'package:just_caffe/src/view/screens/track_order/track_order_screen.dart';

class OrderFooter extends StatelessWidget {
  const OrderFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w, bottom: 24.h + MediaQuery.of(context).padding.bottom),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        border: Border.all(color: context.dividerColor, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppAssets.load(
                    SvgPath.bagIcon,
                    width: 24.w,
                    colorFilter: const ColorFilter.mode(
                      Color(0xffC67C4E),
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cash/Wallet",
                        style: AppTextStyles.body3.copyWith(
                          color: context.primaryText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "\$ 5.53",
                        style: AppTextStyles.body4.copyWith(
                          color: const Color(0xffC67C4E),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(Icons.keyboard_arrow_down, size: 24.sp, color: context.primaryText),
            ],
          ),
          SizedBox(height: 16.h),
          AppPrimaryButton(
            text: "Order",
            textColor: Colors.white,
            onTap: () {
              AppNavigator.pushToNextScreen(
                name: TrackOrderScreen.routeName,
                child: const TrackOrderScreen(),
              );
            },
          ),
        ],
      ),
    );
  }
}
