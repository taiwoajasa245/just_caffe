import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';

class CoffeeDescription extends StatelessWidget {
  final String description;

  const CoffeeDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: AppTextStyles.heading3.copyWith(
            color: context.primaryText,
          ),
        ),
        SizedBox(height: 12.h),
        RichText(
          text: TextSpan(
            text: description,
            style: AppTextStyles.body4.copyWith(
              color: context.secondaryText,
              height: 1.6,
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(
                text: " Read More",
                style: AppTextStyles.body3.copyWith(
                  color: const Color(0xffC67C4E),
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
