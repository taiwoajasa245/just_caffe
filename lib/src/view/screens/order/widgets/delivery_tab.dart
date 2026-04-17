import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';

class DeliveryTab extends HookWidget {
  const DeliveryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = useState(0);

    return Container(
      height: 48.h,
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: context.subSurfaceColor,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => selectedTab.value = 0,
              behavior: HitTestBehavior.opaque,
              child: Container(
                margin: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: selectedTab.value == 0 ? const Color(0xffC67C4E) : Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    "Deliver",
                    style: AppTextStyles.body3.copyWith(
                      color: selectedTab.value == 0 ? Colors.white : context.primaryText,
                      fontWeight: selectedTab.value == 0 ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => selectedTab.value = 1,
              behavior: HitTestBehavior.opaque,
              child: Container(
                margin: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: selectedTab.value == 1 ? const Color(0xffC67C4E) : Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    "Pick Up",
                    style: AppTextStyles.body3.copyWith(
                      fontWeight: selectedTab.value == 1 ? FontWeight.w600 : FontWeight.w400,
                      color: selectedTab.value == 1 ? Colors.white : context.primaryText,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
