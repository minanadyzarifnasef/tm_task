import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamweelytask/core/constants/string_constants.dart';
import 'package:tamweelytask/core/theming/widgets/subtitle_text.dart';
import 'package:tamweelytask/core/theming/widgets/title_text.dart';
import 'package:tamweelytask/features/contactUs/ui/widgts/contact_form.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/dimensions_constants.dart';
import '../../../core/theming/widgets/appbar.dart';
class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: "connect_us".tr(),back: true,),
      body: Container(
        width: width.w,height: height.h,
        padding:EdgeInsets.all(edge),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              GestureDetector(
                onTap: ()=>whatsapp("+201152204422"),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(whatsAppImg,width: 25.w,),
                    SizedBox(width: edge,),
                    const SubTitleText(text: "+201152204422",fontSize: 20,)
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              GestureDetector(
                onTap: ()=>openEmailApp("asd@gmail.com"),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(gmailImg,width: 25.w,),
                    SizedBox(width: edge,),
                    const SubTitleText(text: "asd@gmail.com",fontSize: 20,)
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              const ContactForm(),
            ],
          ),
        ),
      ),
    );
  }
  whatsapp(String contact) async{
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try{
      if(Platform.isIOS){
        await launchUrl(Uri.parse(iosUrl));
      }
      else{
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception{
      debugPrint('WhatsApp is not installed.');
    }
  }
   openEmailApp(email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Hello&body=I wanted to reach out...',
    );

    await launchUrl(emailLaunchUri);
  }
}
