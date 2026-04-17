import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Summary",
            style: AppTextStyles.heading3.copyWith(
              color: context.primaryText,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price",
                style: AppTextStyles.body3.copyWith(
                  color: const Color(0xff2F2D2C),
                ),
              ),
              Text(
                "\$ 4.53",
                style: AppTextStyles.body3.copyWith(
                  color: const Color(0xff2F2D2C),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery Fee",
                style: AppTextStyles.body3.copyWith(
                  color: const Color(0xff2F2D2C),
                ),
              ),
              Row(
                children: [
                  Text(
                    "\$ 2.0",
                    style: AppTextStyles.heading4.copyWith(
                      color: context.primaryText,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "\$ 1.0",
                    style: AppTextStyles.heading4.copyWith(
                      color: context.primaryText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 24.h),
          Divider(color: context.dividerColor, thickness: 1),
        ],
      ),
    );
  }
}
