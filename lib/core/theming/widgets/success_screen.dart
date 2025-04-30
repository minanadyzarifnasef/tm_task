import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tamweelytask/core/constants/dimensions_constants.dart';
import 'package:tamweelytask/core/constants/string_constants.dart';
import 'package:tamweelytask/core/helpers/app_utilities.dart';
import 'package:tamweelytask/core/helpers/navigate_extension.dart';
import 'package:tamweelytask/core/routing/routes.dart';
import 'package:tamweelytask/core/theming/widgets/go_button.dart';
import 'package:tamweelytask/core/theming/widgets/title_text.dart';
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({required this.message,super.key});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: width.w,),
          Container(
            height: height.h *0.4,
            margin: EdgeInsets.only(bottom: 30.h),
            child: Lottie.asset(
              successUrl,
              repeat: false,
              reverse: false,
              width: width.w,
              height: height.h,
              backgroundLoading: true,
              //controller: controller,
              onLoaded: (composition) {

              },
            ),
          ),
          TitleText(text: message),
          SizedBox(height: 60.h,),
          GoButton(text: "back_to_home".tr(), onTap: ()=>context.pushNamedAndRemoveUntil(Routes.homeScreen,predicate: false))
        ],
      ),
    );
  }
}
