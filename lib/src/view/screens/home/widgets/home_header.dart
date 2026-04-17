import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/constants/app_assets.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/core/theme/app_theme.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: AppTextStyles.body3.copyWith(
                    color: const Color(0xffA2A2A2),
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      "Bilzen, Tanjungbalai",
                      style: AppTextStyles.heading4.copyWith(
                        color: const Color(0xffDDDDDD),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    AppAssets.load(
                      SvgPath.arrowDownIcon,
                      colorFilter: const ColorFilter.mode(
                        Color(0xffDDDDDD),
                        BlendMode.srcIn,
                      ),
                      width: 14.w,
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                final appTheme = Provider.of<AppTheme>(context, listen: false);
                // Check actual current brightness and flip to opposite
                final currentlyDark = Theme.of(context).brightness == Brightness.dark;
                appTheme.setThemeMode(
                  currentlyDark ? ThemeMode.light : ThemeMode.dark,
                );
              },
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  context.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 52.h,
                decoration: BoxDecoration(
                  color: const Color(0xff313131),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    AppAssets.load(
                      SvgPath.searchIcon,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                      width: 20.w,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: TextField(
                        style: AppTextStyles.body3.copyWith(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Search coffee",
                          hintStyle: AppTextStyles.body3.copyWith(
                            color: const Color(0xffA2A2A2),
                          ),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Container(
              height: 52.h,
              width: 52.h,
              decoration: BoxDecoration(
                color: const Color(0xffC67C4E),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Center(
                child: AppAssets.load(
                  SvgPath.filterIcon,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                  width: 20.w,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
