import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/constants/app_assets.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';
import 'package:just_caffe/src/core/theme/app_colors.dart';
import 'package:just_caffe/src/view/screens/cart/cart_screen.dart';
import 'package:just_caffe/src/view/screens/favourite/favourite_screen.dart';
import 'package:just_caffe/src/view/screens/home/home_screen.dart';
import 'package:just_caffe/src/view/screens/notifications/notifications_screen.dart';

class BaseView extends StatefulHookWidget {
  const BaseView({super.key});
  static const routeName = '/base-view';

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  Widget build(BuildContext context) {
    final selectedTab = useState("Home");
    final selectedIndex = useState(0);

    useEffect(() {
      selectedTab.value = selectedTab.value;
      selectedIndex.value = selectedIndex.value;

      return null;
    }, [selectedTab.value, selectedIndex.value]);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: selectedIndex.value,
                children: [
                  HomeScreen(),
                  FavouriteScreen(),
                  CartScreen(),
                  NotificationsScreen(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: context.isDarkMode
              ? AppColors.surfacePrimaryDark
              : AppColors.surfacePrimaryLight,
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: 60.h,
          child: Row(
            children: [
              BottomBarItem(
                isSelected: selectedTab.value == "Home",
                name: "Home",
                icon: AppAssets.load(
                  SvgPath.homeIcon,
                  colorFilter: ColorFilter.mode(
                    context.isDarkMode
                        ? AppColors.textIconHighDark
                        : AppColors.textIconHighLight,
                    BlendMode.srcIn,
                  ),
                ),
                selectedIcon: AppAssets.load(
                  SvgPath.homeFilledIcon,
                  colorFilter: ColorFilter.mode(
                    context.isDarkMode
                        ? AppColors.surfaceBrandDark
                        : AppColors.surfaceBrandLight,
                    BlendMode.srcIn,
                  ),
                ),
                onTap: () {
                  selectedTab.value = "Home";
                  selectedIndex.value = 0;
                },
              ),
              BottomBarItem(
                isSelected: selectedTab.value == "Favourite",
                name: "Favourite",
                icon: AppAssets.load(
                  SvgPath.heartIcon,
                  colorFilter: ColorFilter.mode(
                    context.isDarkMode
                        ? AppColors.textIconHighDark
                        : AppColors.textIconHighLight,
                    BlendMode.srcIn,
                  ),
                ),
                selectedIcon: AppAssets.load(
                  SvgPath.heartFilledIcon,
                  colorFilter: ColorFilter.mode(
                    context.isDarkMode
                        ? AppColors.surfaceBrandDark
                        : AppColors.surfaceBrandLight,
                    BlendMode.srcIn,
                  ),
                ),
                onTap: () {
                  selectedTab.value = "Favourite";
                  selectedIndex.value = 1;
                },
              ),
              BottomBarItem(
                isSelected: selectedTab.value == "Cart",
                name: "Cart",
                icon: AppAssets.load(
                  SvgPath.bagIcon,
                  colorFilter: ColorFilter.mode(
                    context.isDarkMode
                        ? AppColors.textIconHighDark
                        : AppColors.textIconHighLight,
                    BlendMode.srcIn,
                  ),
                ),
                selectedIcon: AppAssets.load(
                  SvgPath.bagFilledIcon,
                  colorFilter: ColorFilter.mode(
                    context.isDarkMode
                        ? AppColors.surfaceBrandDark
                        : AppColors.surfaceBrandLight,
                    BlendMode.srcIn,
                  ),
                ),
                onTap: () {
                  selectedTab.value = "Cart";
                  selectedIndex.value = 2;
                },
              ),
              BottomBarItem(
                isSelected: selectedTab.value == "Notifications",
                name: "Notifications",
                icon: AppAssets.load(
                  SvgPath.notificationIcon,
                  colorFilter: ColorFilter.mode(
                    context.isDarkMode
                        ? AppColors.textIconHighDark
                        : AppColors.textIconHighLight,
                    BlendMode.srcIn,
                  ),
                ),
                selectedIcon: AppAssets.load(
                  SvgPath.notificationFilledIcon,
                  colorFilter: ColorFilter.mode(
                    context.isDarkMode
                        ? AppColors.surfaceBrandDark
                        : AppColors.surfaceBrandLight,
                    BlendMode.srcIn,
                  ),
                ),
                onTap: () {
                  selectedTab.value = "Notifications";
                  selectedIndex.value = 3;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBarItem extends StatefulWidget {
  const BottomBarItem({
    super.key,
    required this.isSelected,
    required this.name,
    required this.icon,
    required this.onTap,
    required this.selectedIcon,
  });

  final bool isSelected;
  final String name;
  final Widget icon;
  final VoidCallback onTap;
  final Widget selectedIcon;

  @override
  State<BottomBarItem> createState() => _BottomBarItemState();
}

class _BottomBarItemState extends State<BottomBarItem> {
  bool _isTapped = false;

  void _handleTap() async {
    setState(() => _isTapped = true);

    await Future.delayed(const Duration(milliseconds: 300));

    setState(() => _isTapped = false);
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: _handleTap,
        behavior: .opaque,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _isTapped ? 100 : 0,
              height: _isTapped ? 100 : 0,
              decoration: BoxDecoration(
                shape: .circle,
                color: Color(0xffC67C4E).withValues(alpha: 0.15),
              ),
            ),

            Column(
              mainAxisAlignment: .center,
              children: [
                SizedBox(height: 1.h),
                widget.isSelected ? widget.selectedIcon : widget.icon,
                SizedBox(height: 8.h),

                Container(
                  width: 10,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: .circular(18.r),
                    color: widget.isSelected
                        ? (context.isDarkMode
                              ? AppColors.surfaceBrandDark
                              : AppColors.surfaceBrandLight)
                        : (context.isDarkMode
                              ? AppColors.surfacePrimaryDark
                              : AppColors.surfacePrimaryLight),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
