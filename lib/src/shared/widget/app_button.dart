import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';
import 'package:just_caffe/src/core/extension/num_extension.dart';
import 'package:just_caffe/src/core/theme/app_colors.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    this.leading,
    this.trialing,
    required this.text,
    this.onTap,
    this.enable = true,
    this.isLoading = false,
    this.textColor,
    super.key,
  });

  final Widget? leading;
  final Widget? trialing;
  final String text;
  final VoidCallback? onTap;
  final bool enable;
  final bool isLoading;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final bool canTap = enable && !isLoading;

    return Bounce(
      duration: const Duration(milliseconds: 500),
      onTap: canTap
          ? () {
              FocusScope.of(context).unfocus();
              onTap?.call();
            }
          : () => FocusScope.of(context).unfocus(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 20.w),
        decoration: BoxDecoration(
          color: context.isDarkMode
              ? AppColors.surfaceBrandDark
              : AppColors.surfaceBrandLight,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 20.r,
                  width: 20.r,
                  child: CircularProgressIndicator.adaptive(strokeWidth: 2.5),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (leading != null) ...[leading!, SizedBox(width: 10.w)],
                    Text(
                      text,
                      style: AppTextStyles.body1.copyWith(
                        fontSize: 16.fontSize,
                        fontWeight: FontWeight.w600,
                        color:
                            textColor ??
                            (context.isDarkMode
                                ? AppColors.textIconHighDark
                                : AppColors.textIconHighLight),
                      ),
                    ),
                    if (trialing != null) ...[SizedBox(width: 10.w), trialing!],
                  ],
                ),
        ),
      ),
    );
  }
}
