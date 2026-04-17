import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';

class OrderHeader extends StatelessWidget {
  final VoidCallback onBack;

  const OrderHeader({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Semantics(
              button: true,
              label: 'Back',
              child: GestureDetector(
                onTap: onBack,
                child: Icon(Icons.arrow_back_ios_new, size: 20.sp, color: context.primaryText),
              ),
            ),
          ),
          Text(
            "Order",
            style: AppTextStyles.heading3.copyWith(
              color: context.primaryText,
            ),
          ),
        ],
      ),
    );
  }
}
