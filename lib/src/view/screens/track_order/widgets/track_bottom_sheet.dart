import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/constants/app_assets.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';

class TrackBottomSheet extends StatelessWidget {
  const TrackBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 44.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: context.dividerColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "10 minutes left",
              style: AppTextStyles.heading2.copyWith(
                color: const Color(0xff2F2D2C),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "Delivery to Jl. Kpg Sutoyo",
              style: AppTextStyles.body4.copyWith(
                color: const Color(0xff9B9B9B),
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(child: _buildProgressSegment(true)),
                SizedBox(width: 8.w),
                Expanded(child: _buildProgressSegment(true)),
                SizedBox(width: 8.w),
                Expanded(child: _buildProgressSegment(true)),
                SizedBox(width: 8.w),
                Expanded(child: _buildProgressSegment(false)),
              ],
            ),
            SizedBox(height: 24.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: const Color(0xffEAEAEA)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xffEAEAEA)),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: AppAssets.load(
                        SvgPath.bikeManIcon,
                        width: 24.w,
                        colorFilter: const ColorFilter.mode(
                          Color(0xffC67C4E),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivered your order",
                          style: AppTextStyles.heading4.copyWith(
                            color: const Color(0xff2F2D2C),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "We will deliver your goods to you in the shortes possible time.",
                          style: AppTextStyles.body4.copyWith(
                            color: const Color(0xff9B9B9B),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Container(
                  width: 54.w,
                  height: 54.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    color: const Color(0xffC67C4E).withValues(alpha: 0.1),
                  ),
                  child: Center(
                    child: Icon(Icons.person, size: 28.sp, color: const Color(0xffC67C4E)),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Brooklyn Simmons",
                        style: AppTextStyles.heading3.copyWith(
                          color: context.primaryText,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Personal Courier",
                        style: AppTextStyles.body4.copyWith(
                          color: context.secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: const Color(0xffEAEAEA)),
                  ),
                  child: Center(
                    child: AppAssets.load(
                      SvgPath.callingIcon,
                      width: 20.w,
                      colorFilter: const ColorFilter.mode(
                        Color(0xffC67C4E),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressSegment(bool active) {
    return Container(
      height: 4.h,
      decoration: BoxDecoration(
        color: active ? const Color(0xff1FC173) : const Color(0xffDFDFDF),
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
  }
}
