import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamweelytask/core/theming/managers/color_manager.dart';
import 'package:tamweelytask/core/theming/widgets/title_text.dart';

import '../../constants/dimensions_constants.dart';
class TextInput extends StatelessWidget {
  const TextInput({this.controller,this.validatorFun,this.title,this.w,this.maxLine,super.key});
  final TextEditingController? controller ;
 // final String? labelText ;
  final String? title ;
  final  Function? validatorFun ;
  final double? w;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w ?? width.w,

      alignment: Alignment.center,

      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(radius*.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(title!=null)
           Column(
             children: [
               TitleText(
                 text: title ?? "",
                 fontSize: 20,
                 color: fontColor,
                 align: TextAlign.start,
               ),

             ],
           ),

          TextFormField(
            controller: controller,
            maxLines: maxLine??1,
            decoration:   InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 16, vertical: maxLine != null ? 12 : 0),

               border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius*.5),
    borderSide:  BorderSide(
    color: primaryColor.withOpacity(0.1), width: 1)),

                filled: true,
              fillColor: primaryColor.withOpacity(0.1),


            ),
            onTapOutside: (value) => FocusScope.of(context).unfocus(),
            style: const TextStyle(color:fontColor),

            validator: (value) =>validatorFun!=null?validatorFun!(value):(){},

          )
        ],
      ),
    );
  }
}
