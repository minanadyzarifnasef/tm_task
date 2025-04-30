
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tamweelytask/core/theming/widgets/subtitle_text.dart';
import 'package:tamweelytask/core/theming/widgets/title_text.dart';

import '../../constants/dimensions_constants.dart';
import '../../constants/string_constants.dart';
import '../../helpers/app_utilities.dart';
import '../managers/color_manager.dart';
import 'loader.dart';
class BottomSheetList extends StatelessWidget {
  const BottomSheetList({
    required this.value,
    required this.list,
    required this.hint,
    required this.onChange,
    this.title,
    this.titleHint,
    this.loading = false,
    this.enable = true,
    this.radio = true,
    this.w,
    super.key,
  });

  final dynamic value;
  final dynamic list;
  final String hint;
  final String? title;
  final String? titleHint;
  final bool radio;
  final Function(dynamic) onChange;
  final bool loading;
  final bool enable;
  final double? w;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(edge),
        width: width.w,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleText(
              text: titleHint ?? "",
              fontSize: 18,
              color: fontColor,
            ),
            if (loading) 
              SizedBox(height: 100.h,child: const Loader(color: primaryColor)),
            SizedBox(height: edge),
            if (!loading)
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 0.60 * height.h,
              ),
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final item = list[index];

                    return GestureDetector(
                      onTap: () {

                        onChange(item);
                      },
                      child: Container(
                        height: 55.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: edge * 0.5, vertical: 0.25 * edge),
                        margin: EdgeInsets.only(bottom: 0.5 * edge),
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(radius*0.5),
                            border: Border.all(
                                color: value == item
                                    ? primaryColor
                                    : Colors.transparent,
                                width: 1)),
                        child: Row(
                          children: [
                            if(radio)
                            Radio(value: value, groupValue: item, onChanged: (v)=>onChange(item),activeColor: primaryColor,),
                            Expanded(
                                child: SubTitleText(
                                  text: item.getName(),
                                  color: fontColor,
                                  align: TextAlign.start,
                                )),
                            if(!radio)
                            Transform.rotate(angle: AppUtilities().isLTR? 3.14:0,child: SvgPicture.asset(arrowLeft),),

                          ],
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(height: edge * 2),
          ],
        ),
      ),
    );
  }

}
