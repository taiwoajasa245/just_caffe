import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/constants/app_assets.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';

class OrderItem extends HookWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    final quantity = useState(1);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          Container(
            width: 54.w,
            height: 54.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: const DecorationImage(
                image: AssetImage(ImagePath.coffee4),
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
                  "Caffe Mocha",
                  style: AppTextStyles.heading3.copyWith(
                    color: context.primaryText,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Deep Foam",
                  style: AppTextStyles.body4.copyWith(
                    color: context.secondaryText,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (quantity.value > 1) quantity.value--;
                },
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
                "${quantity.value}",
                style: AppTextStyles.heading4.copyWith(
                  color: const Color(0xff2F2D2C),
                ),
              ),
              SizedBox(width: 14.w),
              GestureDetector(
                onTap: () => quantity.value++,
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
