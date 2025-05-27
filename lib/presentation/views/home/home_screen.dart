import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamweelytask/core/constants/dimensions_constants.dart';
import 'package:tamweelytask/core/constants/string_constants.dart';
import 'package:tamweelytask/core/utils/extension.dart';


import '../../../core/theming/widgets/go_button.dart';
import '../../../routing/routes.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SizedBox(
        width: width.w,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              const Spacer(),
              Image.asset(logoImg,width: 160.w,),
              const Spacer(),
              GoButton(text: "connect_us".tr(), icon:contactUs,onTap: ()=>context.pushNamed(Routes.contactUsScreen)),
              SizedBox(height: edge,),
              GoButton(text: "products".tr(),icon: products, onTap: ()=>context.pushNamed(Routes.productScreen)),
              SizedBox(height: edge,),
              GoButton(text: "submit_complaint".tr(),icon: complaint, onTap: ()=>context.pushNamed(Routes.submitComplaintScreen)),
              SizedBox(height: edge,),
              GoButton(text: "about_us".tr(),icon: aboutUs, onTap: ()=>context.pushNamed(Routes.aboutUsScreen)),
              const Spacer(),
            ]
        ),
      ),
    );
  }
}
