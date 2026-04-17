import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/constants/app_assets.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';
import 'widgets/favourite_item.dart';

class FavouriteScreen extends HookWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favourites = useState<List<Map<String, dynamic>>>([
      {
        "id": 1,
        "image": ImagePath.coffee4,
        "title": "Caffe Mocha",
        "subtitle": "Deep Foam",
        "price": 4.53,
        "rating": 4.8
      },
      {
        "id": 2,
        "image": ImagePath.coffee5,
        "title": "Flat White",
        "subtitle": "Espresso",
        "price": 3.53,
        "rating": 4.8
      },
      {
        "id": 3,
        "image": ImagePath.coffee2,
        "title": "Latte",
        "subtitle": "With Milk",
        "price": 5.20,
        "rating": 4.8
      },
    ]);

    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    "Favourites",
                    style: AppTextStyles.heading3.copyWith(
                      color: context.primaryText,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: favourites.value.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           AppAssets.load(
                             SvgPath.heartIcon,
                             width: 80.w,
                             colorFilter: const ColorFilter.mode(
                               Color(0xffDEDEDE),
                               BlendMode.srcIn,
                             ),
                           ),
                           SizedBox(height: 16.h),
                           Text(
                             "No favourites yet",
                             style: AppTextStyles.heading4.copyWith(
                               color: context.secondaryText,
                             ),
                           ),
                        ],
                      ).animate().fadeIn(duration: 400.ms),
                    )
                  : GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                        childAspectRatio: 0.65,
                      ),
                      itemCount: favourites.value.length,
                      itemBuilder: (context, index) {
                        final item = favourites.value[index];
                        return FavouriteItem(
                          key: ValueKey(item["id"]),
                          item: item,
                          onRemove: () {
                            favourites.value = [
                              ...favourites.value
                            ]..removeWhere((e) => e["id"] == item["id"]);
                          },
                        ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.1, duration: 400.ms, curve: Curves.easeOut);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}