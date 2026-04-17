import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/constants/app_assets.dart';
import 'package:just_caffe/src/core/typography/app_text_styles.dart';
import 'package:just_caffe/src/core/navigation/navigator.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';
import 'package:just_caffe/src/view/screens/order/order_screen.dart';
import 'widgets/cart_item.dart';
import 'widgets/cart_footer.dart';

class CartScreen extends HookWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = useState<List<Map<String, dynamic>>>([
      {
        "id": 1,
        "image": ImagePath.coffee4,
        "title": "Caffe Mocha",
        "subtitle": "Deep Foam",
        "price": 4.53,
        "quantity": 1,
      },
      {
        "id": 2,
        "image": ImagePath.coffee5,
        "title": "Flat White",
        "subtitle": "Espresso",
        "price": 3.53,
        "quantity": 2,
      },
    ]);

    num calculateTotal() {
      num total = 0;
      for (var item in cartItems.value) {
        total += item["price"] * item["quantity"];
      }
      return total;
    }

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
                    "My Cart",
                    style: AppTextStyles.heading3.copyWith(
                      color: context.primaryText,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: cartItems.value.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppAssets.load(
                             SvgPath.bagIcon,
                             width: 80.w,
                             colorFilter: const ColorFilter.mode(
                               Color(0xffDEDEDE),
                               BlendMode.srcIn,
                             ),
                           ),
                           SizedBox(height: 16.h),
                           Text(
                             "Your cart is empty",
                             style: AppTextStyles.heading4.copyWith(
                               color: context.secondaryText,
                             ),
                           ),
                        ],
                      ).animate().fadeIn(duration: 400.ms),
                    )
                  : ListView.builder(
                      itemCount: cartItems.value.length,
                      itemBuilder: (context, index) {
                        final item = cartItems.value[index];
                        return Dismissible(
                          key: ValueKey(item["id"]),
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) {
                            final List<Map<String, dynamic>> newList = List.from(cartItems.value);
                            newList.removeAt(index);
                            cartItems.value = newList;
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
                          child: CartItem(
                            item: item,
                            onIncrease: () {
                              final newList = List<Map<String, dynamic>>.from(cartItems.value);
                              newList[index] = {...newList[index]};
                              newList[index]["quantity"]++;
                              cartItems.value = newList;
                            },
                            onDecrease: () {
                              final newList = List<Map<String, dynamic>>.from(cartItems.value);
                              if (newList[index]["quantity"] > 1) {
                                newList[index] = {...newList[index]};
                                newList[index]["quantity"]--;
                                cartItems.value = newList;
                              }
                            },
                          ),
                        ).animate().fadeIn(duration: 400.ms).slideX(begin: 0.1, curve: Curves.easeOut);
                      },
                    ),
            ),
            if (cartItems.value.isNotEmpty)
              CartFooter(
                totalPrice: calculateTotal(),
                onCheckout: () {
                  AppNavigator.pushToNextScreen(
                    name: OrderScreen.routeName,
                    child: const OrderScreen(),
                  );
                },
              ).animate().slideY(begin: 1, duration: 400.ms).fadeIn(),
          ],
        ),
      ),
    );
  }
}