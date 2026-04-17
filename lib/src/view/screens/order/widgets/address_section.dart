import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivery Address",
            style: AppTextStyles.heading3.copyWith(
              color: context.primaryText,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "Jl. Kpg Sutoyo",
            style: AppTextStyles.body3.copyWith(
              color: const Color(0xff2F2D2C),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.",
            style: AppTextStyles.body4.copyWith(
              color: context.secondaryText,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              _buildActionButton(context, Icons.edit_outlined, "Edit Address"),
              SizedBox(width: 8.w),
              _buildActionButton(context, Icons.list_alt_outlined, "Add Note"),
            ],
          ),
          SizedBox(height: 24.h),
          Divider(color: context.dividerColor, thickness: 1),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: context.backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.dividerColor),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14.sp, color: context.primaryText),
          SizedBox(width: 4.w),
          Text(
            label,
            style: AppTextStyles.body4.copyWith(
              color: context.primaryText,
            ),
          ),
        ],
      ),
    );
  }
}
