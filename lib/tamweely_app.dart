import 'package:easy_localization/easy_localization.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tamweelytask/routing/app_router.dart';
import 'package:tamweelytask/routing/routes.dart';


import 'core/constants/dimensions_constants.dart';
import 'core/constants/string_constants.dart';
import 'core/di/dependency_injection.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'core/services/navigation_service.dart';
import 'core/theming/manager/color_manager.dart';
import 'core/theming/widgets/subtitle_text.dart';
import 'core/utils/app_utilities.dart';

class TamweelyApp extends StatelessWidget {
  final AppRouter appRouter;

  const TamweelyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    AppUtilities().init();
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child:
      MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      //  navigatorKey: NavigationService.navigatorKey,
        navigatorKey: GetIt.instance<NavigationService>().navigatorKey,

        debugShowCheckedModeBanner: false,
        title: appName,
        theme: ThemeData(
          fontFamily: fontName,
          colorScheme: Theme.of(context).colorScheme.copyWith(
            surface: whiteColor
          )
        ),

        initialRoute: Routes.splashScreen,
        onGenerateRoute: appRouter.generateRoute,

        builder: (context, widget) {
          return FutureBuilder<bool>(
            future: InternetConnectionChecker.instance.hasConnection,
            builder: (context, initialSnapshot) {
              // If we're still checking the initial connection, show the regular app
              if (!initialSnapshot.hasData) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: TextScaler.noScaling,
                  ),
                  child: widget!,
                );
              }

              return StreamBuilder<InternetConnectionStatus>(
                stream: InternetConnectionChecker.instance.onStatusChange,
                initialData: initialSnapshot.data == true ? InternetConnectionStatus.connected : InternetConnectionStatus.disconnected,
                builder: (context, snapshot) {
                  final isConnected = snapshot.data == InternetConnectionStatus.connected;

                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaler: TextScaler.noScaling,
                    ),
                    child: Scaffold(
                      // backgroundColor: Colors.yellow,
                      body: Column(
                        children: [
                          if (!isConnected)
                            Container(
                              //  padding: EdgeInsets.only(top: edge * 2.4, bottom: edge * 0.5),
                              decoration: const BoxDecoration(
                                color: errorColor,
                              ),
                              width: width.w,
                              child: Column(
                                children: [
                                  SizedBox(height:  edge * 2.4),
                                  SubTitleText(
                                    text: 'no_internet_connections'.tr(),
                                    align: TextAlign.center,
                                    fontSize: 14,
                                    color: whiteColor,
                                  ),
                                  SizedBox(height:  edge * 0.5),

                                ],
                              ),
                            ),
                          Expanded(child: widget!),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      )
    );
  }
}
