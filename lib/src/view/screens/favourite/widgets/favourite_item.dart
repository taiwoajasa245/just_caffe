import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/constants/app_assets.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';

class FavouriteItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onRemove;

  const FavouriteItem({
    super.key,
    required this.item,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 132.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(
                    image: AssetImage(item["image"] as String),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: GestureDetector(
                  onTap: onRemove,
                  child: Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      color: context.surfaceColor,
                      shape: BoxShape.circle,
                    ),
                    child: AppAssets.load(
                      SvgPath.heartFilledIcon,
                      width: 16.w,
                      colorFilter: const ColorFilter.mode(
                        Color(0xffED5151),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(16.r),
                      topLeft: Radius.circular(12.r),
                    ),
                  ),
                  child: Row(
                    children: [
                      AppAssets.load(
                        SvgPath.starIcon,
                        width: 12.w,
                        colorFilter: const ColorFilter.mode(
                          Color(0xffD17842),
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        item["rating"].toString(),
                        style: AppTextStyles.body4.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["title"] as String,
                  style: AppTextStyles.heading3.copyWith(
                    color: context.primaryText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  item["subtitle"] as String,
                  style: AppTextStyles.body4.copyWith(
                    color: context.secondaryText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12.h),
                Text(
                  "\$ ${item["price"]}",
                  style: AppTextStyles.heading3.copyWith(
                    color: const Color(0xff2F4B4E),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
