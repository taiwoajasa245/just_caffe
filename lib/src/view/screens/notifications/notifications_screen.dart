import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/constants/app_assets.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';
import 'widgets/notification_tile.dart';

class NotificationsScreen extends HookWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = useState<List<Map<String, dynamic>>>([
      {
        "id": 1,
        "type": "order",
        "title": "Order Arriving Soon",
        "message": "Your order is 5 minutes away. Prepare to receive your Caffe Mocha!",
        "time": "10:30 AM",
      },
      {
        "id": 2,
        "type": "promo",
        "title": "25% Off Promo Code",
        "message": "Use code CAFFE25 to get 25% off your next flat white. Valid until tomorrow.",
        "time": "Yesterday",
      },
      {
        "id": 3,
        "type": "order",
        "title": "Order Delivered",
        "message": "Your Americano has been delivered successfully. Enjoy your coffee!",
        "time": "Mon, 12 Oct",
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
                    "Notifications",
                    style: AppTextStyles.heading3.copyWith(
                      color: context.primaryText,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: notifications.value.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppAssets.load(
                             SvgPath.notificationIcon,
                             width: 80.w,
                             colorFilter: const ColorFilter.mode(
                               Color(0xffDEDEDE),
                               BlendMode.srcIn,
                             ),
                           ),
                           SizedBox(height: 16.h),
                           Text(
                             "No new notifications",
                             style: AppTextStyles.heading4.copyWith(
                               color: context.secondaryText,
                             ),
                           ),
                        ],
                      ).animate().fadeIn(duration: 400.ms),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      itemCount: notifications.value.length,
                      itemBuilder: (context, index) {
                        final item = notifications.value[index];
                        return Dismissible(
                          key: ValueKey(item["id"]),
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) {
                            final List<Map<String, dynamic>> newList = List.from(notifications.value);
                            newList.removeAt(index);
                            notifications.value = newList;
                          },
                          background: Container(
                            margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: const Color(0xffED5151),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 24.w),
                            child: const Icon(Icons.delete, color: Colors.white),
                          ),
                          child: NotificationTile(notification: item),
                        ).animate().fadeIn(duration: 400.ms).slideX(begin: 0.1, curve: Curves.easeOut);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}