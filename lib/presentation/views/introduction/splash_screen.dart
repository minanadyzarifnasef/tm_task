import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tamweelytask/core/constants/string_constants.dart';
import 'package:tamweelytask/core/utils/extension.dart';

import '../../../core/constants/dimensions_constants.dart';
import '../../../core/theming/manager/color_manager.dart';
import '../../../routing/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: whiteColor,
      body: SizedBox(
        width: width.w,
        height: height.h,
        child: Stack(

          children: [

            Center(child: Image.asset(logoImg,width: 250.w,),),
         //   SizedBox(height: 50.h,),
           Align(
             alignment: Alignment.bottomCenter,
             child:  Container(
               height: height.h * 0.06,
               margin: EdgeInsets.only(bottom: 30.h),
               child: Lottie.asset(
                 loaderUrl,
                 repeat: true,
                 reverse: true,
                 width: width.w,
                 height: height.h,
                 backgroundLoading: true,
                 //controller: controller,
                 onLoaded: (composition) {
                   // note : this simulate loading data from server
                   Timer(const Duration(seconds: 3), (){
                      context.pushNamedAndRemoveUntil(Routes.welcomeScreen, predicate: false);
                   });
                 },
               ),
             ),
           )


          ],
        ),
      ),
    );
  }
}
