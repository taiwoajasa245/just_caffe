import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.onTap,
    this.fillColor,
    this.border,
    this.contentPadding,
    this.style,
    this.enabledBorder,
    this.filled,

  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int maxLines;
  final VoidCallback? onTap;
  final Color? fillColor;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;
  final InputBorder? enabledBorder;
  final bool? filled;


  @override
  Widget build(BuildContext context) {
    // final colors = context.color;

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
      // style:
      //     style ??
          // context.textTheme.body2.copyWith(
          //   color: colors.textIconMid,
          //   fontSize: 15.sp,
          // ),

      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(
          // color: colors.textIconLow,
          fontSize: 14.sp,
        ),
        fillColor: fillColor,
        // hintStyle: TextStyle(color: colors.textIconMid, fontSize: 14.sp),
        filled: filled,

        // prefix icon
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: EdgeInsets.only(left: 12.w, right: 8.w),
                child: SizedBox(width: 20.w, height: 20.w, child: prefixIcon!),
              )
            : null,

        // suffix icon
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: suffixIcon,
              )
            : null,

        // Borders
        border:
            border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              // borderSide: BorderSide(color: colors.border, width: 1),
            ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          // borderSide: BorderSide(color: colors.surfaceBrand, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          // borderSide: BorderSide(color: colors.surfaceError, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            // color: colors.border.withValues(alpha: 0.4),
            width: 1,
          ),
        ),
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      ),
    );
  }
}
