import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamweelytask/core/theming/widgets/loader.dart';
import 'package:tamweelytask/core/theming/widgets/title_text.dart';

import '../../constants/dimensions_constants.dart';
import '../managers/color_manager.dart';
class GoButton extends StatelessWidget {
  const GoButton({this.w,this.h,this.buttonColor,this.icon,required this.text,required this.onTap,this.loading=false,super.key});
  final double? w ;
  final double? h ;
  final Color? buttonColor;
  final String? icon;
  final String text;
  final Function onTap;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(),
      child: Container(

        width:w?? 230.w, // Expands width when loading
        height:h?? 45.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: buttonColor??primaryColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child:loading?
            const Loader():

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:icon==null? MainAxisAlignment.center: MainAxisAlignment.start,
          children: [

            if(icon!=null)
              Row(
                children: [
                  SizedBox(width: edge,),
                  SvgPicture.asset(icon!,colorFilter: const ColorFilter.mode(whiteColor, BlendMode.srcIn),),
                  SizedBox(width: edge*0.5,)
                ],
              ),
            TitleText(text: text,color: whiteColor,fontSize:20 ,)          ],
        )
      ),
    );
  }
}
