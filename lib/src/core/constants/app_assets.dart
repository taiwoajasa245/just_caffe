import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImagePath {
  static const coffee1 = 'assets/images/coffee 1.png';
  static const coffee2 = 'assets/images/coffee 2.png';
  static const coffee3 = 'assets/images/coffee 3.png';
  static const coffee4 = 'assets/images/coffee 4.png';
  static const coffee5 = 'assets/images/coffee 5.png';
  static const coffee6 = 'assets/images/coffee 6.png';
  static const bannerImg = 'assets/images/banner_img.png';
}

class SvgPath {
  static const arrowDownIcon = 'assets/svgs/arrow_down_ic.svg';
  static const arrowLeftIcon = 'assets/svgs/arrow_left_ic.svg';
  static const arrowRightIcon = 'assets/svgs/arrow_right_ic.svg';
  static const arrowUpIcon = 'assets/svgs/arrow_up_ic.svg';
  static const bagIcon = 'assets/svgs/bag_ic.svg';
  static const beanIcon = 'assets/svgs/bean_ic.svg';
  static const bikeManIcon = 'assets/svgs/bike_man_ic.svg';
  static const callingIcon = 'assets/svgs/calling_ic.svg';
  static const discountIcon = 'assets/svgs/discount_ic.svg';
  static const filterIcon = 'assets/svgs/filter_ic.svg';
  static const gpsIcon = 'assets/svgs/gps_ic.svg';
  static const heartIcon = 'assets/svgs/heart_ic.svg';
  static const homeIcon = 'assets/svgs/home_ic.svg';
  static const milkIcon = 'assets/svgs/milk_ic.svg';
  static const minusCircleIcon = 'assets/svgs/minus_circle_ic.svg';
  static const moreIcon = 'assets/svgs/more_ic.svg';
  static const notificationIcon = 'assets/svgs/notification_ic.svg';
  static const plusCircleIcon = 'assets/svgs/plus_circle_ic.svg';
  static const plusIcon = 'assets/svgs/plus_ic.svg';
  static const searchIcon = 'assets/svgs/search_ic.svg';
  static const starIcon = 'assets/svgs/star_ic.svg';

  static const homeFilledIcon = 'assets/svgs/home_filled_ic.svg';
  static const heartFilledIcon = 'assets/svgs/heart_filled_ic.svg';
  static const bagFilledIcon = 'assets/svgs/bag_filled_ic.svg';
  static const notificationFilledIcon =
      'assets/svgs/notification_filled_ic.svg';
}

class AppAssets {
  static Widget load(
    String path, {

    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
    ColorFilter? colorFilter,
    BlendMode? blendMode,
    double? scale,
  }) {
    if (path.endsWith('.svg')) {
      return SvgPicture.asset(
        path,
        width: width,
        height: height,
        colorFilter: colorFilter,

        fit: fit ?? BoxFit.contain,
      );
    }

    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }
}
