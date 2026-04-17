import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/constants/app_assets.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';

class CoffeeInfo extends StatelessWidget {
  final String title;
  final String subtitle;
  final num rating;
  final int reviews;

  const CoffeeInfo({
    super.key,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.heading2.copyWith(
                    color: context.primaryText,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  subtitle,
                  style: AppTextStyles.body4.copyWith(
                    color: context.secondaryText,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    AppAssets.load(
                      SvgPath.starIcon,
                      width: 20.w,
                      colorFilter: const ColorFilter.mode(
                        Color(0xffD17842),
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      rating.toString(),
                      style: AppTextStyles.heading3.copyWith(
                        color: context.primaryText,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "($reviews)",
                      style: AppTextStyles.body4.copyWith(
                        color: context.secondaryText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                _buildIconBadge(context, SvgPath.bikeManIcon),
                SizedBox(width: 12.w),
                _buildIconBadge(context, SvgPath.beanIcon),
                SizedBox(width: 12.w),
                _buildIconBadge(context, SvgPath.milkIcon),
              ],
            ),
          ],
        ),
        SizedBox(height: 24.h),
        Divider(color: context.dividerColor, thickness: 1),
      ],
    );
  }

  Widget _buildIconBadge(BuildContext context, String svgPath) {
    return Container(
      width: 44.w,
      height: 44.w,
      decoration: BoxDecoration(
        color: context.subSurfaceColor,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: AppAssets.load(
        svgPath,
        // colorFilter: const ColorFilter.mode(Color(0xffC67C4E), BlendMode.srcIn),
      ),
    );
  }
}
