import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/shared/widget/app_button.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';

class CartFooter extends StatelessWidget {
  final num totalPrice;
  final VoidCallback onCheckout;

  const CartFooter({
    super.key,
    required this.totalPrice,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w, bottom: 24.h + MediaQuery.of(context).padding.bottom),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        border: Border.all(color: context.dividerColor, width: 1),
      ),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Price",
                style: AppTextStyles.body4.copyWith(
                  color: context.secondaryText,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "\$ ${totalPrice.toStringAsFixed(2)}",
                style: AppTextStyles.heading2.copyWith(
                  color: const Color(0xffC67C4E),
                ),
              ),
            ],
          ),
          SizedBox(width: 42.w),
          Expanded(
            child: AppPrimaryButton(
              text: "Checkout",
              textColor: Colors.white,
              onTap: onCheckout,
            ),
          ),
        ],
      ),
    );
  }
}
