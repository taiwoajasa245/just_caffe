import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/track_map.dart';
import 'widgets/track_bottom_sheet.dart';
import 'package:just_caffe/src/core/navigation/navigator.dart';
import 'package:just_caffe/src/core/extension/context_extension.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  static const routeName = '/track_order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const TrackMap(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => AppNavigator.pop(),
                    child: Container(
                      width: 44.w,
                      height: 44.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ]
                      ),
                      child: Center(
                        child: Icon(Icons.arrow_back_ios_new, size: 20.sp, color: context.primaryText),
                      ),
                    ),
                  ),
                  Container(
                    width: 44.w,
                    height: 44.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        )
                      ]
                    ),
                    child: Center(
                      child: Icon(Icons.my_location, size: 20.sp, color: context.primaryText),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: TrackBottomSheet(),
          )
        ],
      ),
    );
  }
}
