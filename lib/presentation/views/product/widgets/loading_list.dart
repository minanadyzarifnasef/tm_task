import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tamweelytask/core/constants/dimensions_constants.dart';

import '../../../../core/theming/manager/color_manager.dart';
import '../../../../core/utils/app_utilities.dart';


class LoadingList extends StatelessWidget {
  const LoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: getCrossAxisCount(context), childAspectRatio: 1.7, mainAxisSpacing: 10.w, crossAxisSpacing: 10.w),
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(edge),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(0.6),
                      highlightColor: whiteColor,
                      direction: AppUtilities().isLTR ? ShimmerDirection.ltr : ShimmerDirection.rtl,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.6), borderRadius: BorderRadius.circular(radius)),
                      )),
                ),
                SizedBox(
                  width: edge * 0.5,
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.6),
                            highlightColor: whiteColor,
                            direction: AppUtilities().isLTR ? ShimmerDirection.ltr : ShimmerDirection.rtl,
                            child: Container(
                              width: 100.w,
                              height: 20,
                              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.6), borderRadius: BorderRadius.circular(radius / 2)),
                            )),
                        SizedBox(height: edge,),
                        Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.6),
                            highlightColor: whiteColor,
                            direction: AppUtilities().isLTR ? ShimmerDirection.ltr : ShimmerDirection.rtl,
                            child: Container(
                              width: 150.w,
                              height: 20,
                              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.6), borderRadius: BorderRadius.circular(radius / 2)),
                            )),
                        SizedBox(height: edge/4,),

                        Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.6),
                            highlightColor: whiteColor,
                            direction: AppUtilities().isLTR ? ShimmerDirection.ltr : ShimmerDirection.rtl,
                            child: Container(
                              width: 200.w,
                              height: 20,
                              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.6), borderRadius: BorderRadius.circular(radius / 2)),
                            )),
                        SizedBox(height: edge/4,),

                        Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.6),
                            highlightColor: whiteColor,
                            direction: AppUtilities().isLTR ? ShimmerDirection.ltr : ShimmerDirection.rtl,
                            child: Container(
                              width: 180.w,
                              height: 20,
                              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.6), borderRadius: BorderRadius.circular(radius / 2)),
                            )),
                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  int getCrossAxisCount(BuildContext context) {
    double screenWidth = width.w;

    if (screenWidth < 600) {
      // Phone
      return 1;
    } else if (screenWidth < 900) {
      // Small tablet
      return 2;
    } else {
      // Large tablet or desktop
      return 3;
    }
  }
}
