import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';

class NotificationTile extends StatelessWidget {
  final Map<String, dynamic> notification;

  const NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    bool isPromo = notification["type"] == "promo";

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.dividerColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: isPromo ? const Color(0xffC67C4E).withValues(alpha: 0.1) : const Color(0xff1FC173).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Icon(
                isPromo ? Icons.discount_outlined : Icons.delivery_dining_outlined,
                color: isPromo ? const Color(0xffC67C4E) : const Color(0xff1FC173),
                size: 24.sp,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notification["title"] as String,
                      style: AppTextStyles.heading4.copyWith(
                        color: context.primaryText,
                      ),
                    ),
                    Text(
                      notification["time"] as String,
                      style: AppTextStyles.body4.copyWith(
                        color: context.secondaryText,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  notification["message"] as String,
                  style: AppTextStyles.body4.copyWith(
                    color: context.secondaryText,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
