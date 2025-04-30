//import 'package:another_flushbar/flushbar.dart';

import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/dimensions_constants.dart';
import '../constants/string_constants.dart';
import '../routing/direction_routing.dart';
import '../services/navigation_service.dart';
import '../theming/managers/color_manager.dart';
import '../theming/widgets/subtitle_text.dart';
import '../theming/widgets/title_text.dart';
import 'app_utilities.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    final RouteSettings settings = RouteSettings(name: routeName, arguments: arguments);
    final Route<dynamic>? route = Navigator.of(this).widget.onGenerateRoute!(settings);

    if (route == null || (route is! MaterialPageRoute && route is! CupertinoPageRoute)) {
      throw Exception(
        "Route $routeName is not defined in onGenerateRoute or is not a MaterialPageRoute.",
      );
    }
    final Widget page;
    if (route is PageRoute) {
      page = route.buildPage(this, route.animation ?? const AlwaysStoppedAnimation(1.0), route.secondaryAnimation ?? const AlwaysStoppedAnimation(0.0));
    } else {
      throw Exception("Route $routeName does not support building a page.");
    }
    return Navigator.of(this).push(
      CustomPageRoute(
        page: page,
        duration: const Duration(milliseconds: 300),
        direction: SlideDirection.bottomToTop,
      ),
    );
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    final RouteSettings settings = RouteSettings(name: routeName, arguments: arguments);
    final Route<dynamic>? route = Navigator.of(this).widget.onGenerateRoute!(settings);
    if (route == null || (route is! MaterialPageRoute && route is! CupertinoPageRoute)) {
      throw Exception("Route $routeName is not defined in onGenerateRoute or is not a MaterialPageRoute.");
    }
    final Widget page;
    if (route is PageRoute) {
      page = route.buildPage(this, route.animation ?? const AlwaysStoppedAnimation(1.0), route.secondaryAnimation ?? const AlwaysStoppedAnimation(0.0));
    } else {
      throw Exception("Route $routeName does not support building a page.");
    }
    return Navigator.of(this).pushReplacement(
      CustomPageRoute(
        page: page,
        duration: const Duration(milliseconds: 300),
        direction: SlideDirection.bottomToTop,
      ),
    );
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? arguments, required bool predicate}) {
    final RouteSettings settings = RouteSettings(name: routeName, arguments: arguments);
    final Route<dynamic>? route = Navigator.of(this).widget.onGenerateRoute!(settings);
    if (route == null || (route is! MaterialPageRoute && route is! CupertinoPageRoute)) {
      throw Exception("Route $routeName is not defined in onGenerateRoute or is not a MaterialPageRoute.");
    }
    final Widget page;
    if (route is PageRoute) {
      page = route.buildPage(this, route.animation ?? const AlwaysStoppedAnimation(1.0), route.secondaryAnimation ?? const AlwaysStoppedAnimation(0.0));
    } else {
      throw Exception("Route $routeName does not support building a page.");
    }
    return Navigator.of(this).pushAndRemoveUntil(
      CustomPageRoute(
        page: page,
        duration: const Duration(milliseconds: 300),
        direction: SlideDirection.bottomToTop,
      ),
      (Route<dynamic> route) => predicate,
    );
  }

  void pop() => Navigator.of(this).pop();

  showErrorToast(String msg) {
    Flushbar(
      messageText: Row(
        children: [
          GestureDetector(
            onTap: () => NavigationService.navigatorKey.currentContext?.pop(),
            child: const Icon(Icons.clear),
          ),
          SizedBox(
            width: edge,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(
                text: "error_happen".tr(),
                color: errorColor,
                fontSize: 14,
              ),
              SubTitleText(
                text: msg,
                align: TextAlign.start,
                color: fontColor,
              )
            ],
          )),
          GestureDetector(
            onTap: () => debugPrint("object"),
            child: SvgPicture.asset(errorIcon),
          ),

        ],
      ),

      flushbarPosition: FlushbarPosition.TOP,
      padding: EdgeInsets.symmetric(vertical: edge * 0.6, horizontal: edge),
      margin: EdgeInsets.symmetric(horizontal: edge),
      isDismissible: true,

      duration: const Duration(seconds: 3),
      borderRadius: BorderRadius.circular(radius),
      backgroundColor: errorColor,
      borderColor: whiteColor,



    ).show(this);
  }
}


