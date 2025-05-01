import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/dimensions_constants.dart';
import '../../constants/string_constants.dart';
import '../managers/color_manager.dart';
import 'title_text.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    required this.value,
    required this.title,
    required this.sheetBuilder,
    super.key,
  });

  final dynamic value;

  final String title;

  final Widget Function(BuildContext) sheetBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(
            text: title ,
            fontSize: 20,
            color: fontColor,
            align: TextAlign.start,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return sheetBuilder(context);
                },
              );
            },
            child: Container(
              width: width.w,
              height: 55.h,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: edge * 0.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color: primaryColor.withOpacity(0.1),
                border: Border.all( width: 0.8)
              ),
              child: Row(
                children: [

                     Expanded(
                      child: Text(
                        value?.getName()??"",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  SvgPicture.asset(arrowLeft),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
