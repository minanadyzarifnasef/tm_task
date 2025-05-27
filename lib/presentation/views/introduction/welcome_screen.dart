import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:tamweelytask/core/utils/extension.dart';


import '../../../core/constants/dimensions_constants.dart';
import '../../../core/constants/string_constants.dart';

import '../../../core/theming/manager/color_manager.dart';
import '../../../core/theming/widgets/bottom_sheet_list.dart';
import '../../../core/theming/widgets/subtitle_text.dart';
import '../../../core/theming/widgets/title_text.dart';
import '../../../core/utils/app_utilities.dart';
import '../../../data/models/language/language_model.dart';
import '../../../data/models/language/name_model.dart';
import '../../../routing/routes.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  late final AnimationController _controller;
  bool animate = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
       setState(() {
         animate=true;
       });
        // Do something here
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(edge),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => openLanguageModel(context),
                    child: Row(
                      children: [
                        SubTitleText(text: "current_language_name".tr()),
                        const SizedBox(width: 5),
                        SvgPicture.asset(downArrow),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeInOut,
                    bottom: animate ? -20 : -200,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        bottomOnboardingSvg,
                        width: width.w,
                        colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn),
                      ),
                    ),
                  ),
                  Container(
                    width: width.w,
                    padding: EdgeInsets.symmetric(horizontal: edge),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: heightEdge),

                        Expanded(
                          flex: 2,
                          child:
                          Lottie.asset(
                            welcomeLottifyUrlUrl,
                            repeat: false,
                            controller: _controller,
                            onLoaded: (v){
                              _controller
                                ..duration = v.duration
                                ..forward();
                            }


                          ),
                        ),
                        GestureDetector(
                          onTap: ()=> context.pushNamed(Routes.homeScreen),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width:animate?  180.w:0 , // Expands width when loading
                            height: 40.w,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(radius),
                            ),
                            alignment: Alignment.center,
                            child:  AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),

                              child:Center(
                                  child:TitleText(text: "start_your_journey".tr(),color: whiteColor,fontSize: 16,)
                                // SvgPicture.asset(goArrow,),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 60.h,)

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openLanguageModel(BuildContext context) {

    List<LanguageModel>languages=[
      LanguageModel(name: Name(ar: "اللغة العربية",en: "Arabic Language",code: "ar")),
      LanguageModel(name: Name(ar: "اللغة الانجليزية",en: "English language",code: "en")),

    ];
    LanguageModel selectedLanguage=languages.firstWhere((l)=>l.name?.code==AppUtilities().getAppLanguage());
    showModalBottomSheet(
      context: context,
      backgroundColor:secondaryColor,
      isScrollControlled: true,


      builder: (_) {
        return BottomSheetList(
          value: selectedLanguage, //? "arabic_language".tr() : "english_language".tr(),
          list: languages,
          onChange: (v) {

            if (v.name.code == 'en') {
              AppUtilities().setLocality('en');
            } else {
              AppUtilities().setLocality('ar');
            }
            context.pop();

          },
          title: "select_language".tr(),
        );
      },
    );
  }
}
