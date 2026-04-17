import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';

class CartItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItem({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 72.w,
            height: 72.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                image: AssetImage(item["image"] as String),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["title"] as String,
                  style: AppTextStyles.heading3.copyWith(
                    color: context.primaryText,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  item["subtitle"] as String,
                  style: AppTextStyles.body4.copyWith(
                    color: context.secondaryText,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "\$ ${(item["price"] * item["quantity"]).toStringAsFixed(2)}",
                  style: AppTextStyles.heading3.copyWith(
                    color: const Color(0xff2F4B4E),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: onDecrease,
                child: Container(
                  width: 28.w,
                  height: 28.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: context.dividerColor),
                  ),
                  child: Center(
                    child: Icon(Icons.remove, size: 16.sp, color: context.primaryText),
                  ),
                ),
              ),
              SizedBox(width: 14.w),
              Text(
                "${item["quantity"]}",
                style: AppTextStyles.heading4.copyWith(
                  color: context.primaryText,
                ),
              ),
              SizedBox(width: 14.w),
              GestureDetector(
                onTap: onIncrease,
                child: Container(
                  width: 28.w,
                  height: 28.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: context.dividerColor),
                  ),
                  child: Center(
                    child: Icon(Icons.add, size: 16.sp, color: context.primaryText),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
