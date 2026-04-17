import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/core/constants/app_assets.dart';
import 'package:just_caffe/src/core/navigation/navigator.dart';
import 'package:just_caffe/src/view/screens/detail/detail_screen.dart';
import 'coffee_card.dart';

class CoffeeGrid extends StatelessWidget {
  const CoffeeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final coffees = [
      {
        "image": ImagePath.coffee4,
        "title": "Caffe Mocha",
        "subtitle": "Deep Foam",
        "price": 4.53,
        "rating": 4.8,
      },
      {
        "image": ImagePath.coffee5,
        "title": "Flat White",
        "subtitle": "Espresso",
        "price": 3.53,
        "rating": 4.8,
      },
      {
        "image": ImagePath.coffee5,
        "title": "Flat White",
        "subtitle": "Espresso",
        "price": 3.53,
        "rating": 4.8,
      },
      {
        "image": ImagePath.coffee2,
        "title": "Latte",
        "subtitle": "With Milk",
        "price": 5.20,
        "rating": 4.8,
      },
      {
        "image": ImagePath.coffee3,
        "title": "Americano",
        "subtitle": "Original",
        "price": 3.10,
        "rating": 4.8,
      },
    ];

    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.6,
      ),
      itemCount: coffees.length,
      itemBuilder: (context, index) {
        final item = coffees[index];
        return CoffeeCard(
          imagePath: item["image"] as String,
          title: item["title"] as String,
          subtitle: item["subtitle"] as String,
          price: item["price"] as num,
          rating: item["rating"] as num,
          onTap: () {
            AppNavigator.pushToNextScreen(
              child: DetailScreen(),
              name: DetailScreen.routeName,
            );
          },
        );
      },
    );
  }
}
