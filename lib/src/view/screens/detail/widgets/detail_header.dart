import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/constants/app_assets.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';

class DetailHeader extends StatelessWidget {
  final VoidCallback onBack;

  const DetailHeader({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onBack,
            child: Center(
              child: Icon(Icons.arrow_back_ios_new, size: 20.sp, color: context.primaryText),
            ),
          ),
          Text(
            "Detail",
            style: AppTextStyles.heading3.copyWith(
              color: context.primaryText,
            ),
          ),
          AppAssets.load(
            SvgPath.heartIcon, // Unfilled heart
            width: 24.w,
            colorFilter: const ColorFilter.mode(
              Color(0xff2F2D2C),
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
