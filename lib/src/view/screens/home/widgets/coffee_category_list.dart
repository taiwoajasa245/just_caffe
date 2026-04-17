import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';

class CoffeeCategoryList extends HookWidget {
  const CoffeeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ["All Coffee", "Machiato", "Latte", "Americano"];
    final selectedIndex = useState(0);

    return SizedBox(
      height: 38.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        separatorBuilder: (_, _) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex.value == index;
          return GestureDetector(
            onTap: () => selectedIndex.value = index,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xffC67C4E) : context.surfaceColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: AppTextStyles.body3.copyWith(
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? Colors.white : context.primaryText,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
