import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamweelytask/core/constants/dimensions_constants.dart';
import 'package:tamweelytask/core/theming/widgets/go_button.dart';
import 'package:tamweelytask/core/theming/widgets/subtitle_text.dart';
import 'package:tamweelytask/core/theming/widgets/title_text.dart';

import '../../../../core/theming/manager/color_manager.dart';
import '../../../../data/models/products/products_response.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({required this.productsResponse,super.key});
  final ProductsResponse productsResponse;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productsResponse.products?.length??0,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: getCrossAxisCount(context), childAspectRatio: 1.7, mainAxisSpacing: 10.w, crossAxisSpacing: 10.w),
      itemBuilder: (context, index) {
        var product=productsResponse.products![index];
        return Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(edge),
            child: Column(
              children: [
                Expanded(child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              color: whiteColor,
                              image: DecorationImage(image: NetworkImage(product.images?.first??product.thumbnail??""),fit: BoxFit.cover)
                          ),
                        )
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
                            TitleText(text: product.title??"",fontSize: 18,align: TextAlign.start,),
                            SizedBox(height: edge/2,),
                            Expanded(child: SubTitleText(text: product.description??"",align: TextAlign.start,))
                          ],
                        )),
                  ],
                )),
                SizedBox(height: edge,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GoButton(text: "more".tr(),w: 70,h:30, onTap: (){})
                  ],
                ),
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
