import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/constants/app_assets.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: context.dividerColor),
      ),
      child: Row(
        children: [
          AppAssets.load(
            SvgPath.discountIcon,
            width: 24.w,
            colorFilter: const ColorFilter.mode(
              Color(0xffC67C4E),
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              "1 Discount is applied",
              style: AppTextStyles.heading4.copyWith(
                color: context.primaryText,
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16.sp, color: context.primaryText),
        ],
      ),
    );
  }
}
