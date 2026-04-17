import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';
import 'widgets/order_header.dart';
import 'widgets/delivery_tab.dart';
import 'widgets/address_section.dart';
import 'widgets/order_item.dart';
import 'widgets/discount_banner.dart';
import 'widgets/payment_summary.dart';
import 'widgets/order_footer.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  static const routeName = '/order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            OrderHeader(onBack: () => Navigator.pop(context)),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    const DeliveryTab(),
                    SizedBox(height: 24.h),
                    const AddressSection(),
                    SizedBox(height: 24.h),
                    const OrderItem(),
                    SizedBox(height: 24.h),
                    Container(
                      height: 4.h,
                      color: context.subSurfaceColor, // subtle broad divider
                    ),
                    SizedBox(height: 24.h),
                    const DiscountBanner(),
                    SizedBox(height: 24.h),
                    const PaymentSummary(),
                    SizedBox(height: 32.h),
                  ].animate(interval: 100.ms).fadeIn(duration: 400.ms).slideY(begin: 0.1, duration: 400.ms, curve: Curves.easeOut),
                ),
              ),
            ),
            const OrderFooter().animate().slideY(begin: 1, duration: 600.ms, curve: Curves.easeOut).fadeIn(),
          ],
        ),
      ),
    );
  }
}
