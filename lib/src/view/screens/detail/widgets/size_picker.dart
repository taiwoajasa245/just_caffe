import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';

class SizePicker extends HookWidget {
  const SizePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final sizes = ["S", "M", "L"];
    final selectedIndex = useState(1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Size",
          style: AppTextStyles.heading3.copyWith(
            color: context.primaryText,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(sizes.length, (index) {
            final isSelected = selectedIndex.value == index;
            return Expanded(
              child: GestureDetector(
                onTap: () => selectedIndex.value = index,
                behavior: HitTestBehavior.opaque,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 42.h,
                  margin: EdgeInsets.only(
                    right: index < sizes.length - 1 ? 16.w : 0,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xffFFF5EE).withValues(alpha: context.isDarkMode ? 0.05 : 1) : context.surfaceColor,
                    border: Border.all(
                      color: isSelected ? const Color(0xffC67C4E) : context.dividerColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Text(
                      sizes[index],
                      style: AppTextStyles.body3.copyWith(
                        color: isSelected
                            ? const Color(0xffC67C4E)
                            : context.primaryText,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
