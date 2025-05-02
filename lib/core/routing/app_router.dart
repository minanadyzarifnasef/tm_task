import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamweelytask/core/routing/routes.dart';
import 'package:tamweelytask/core/theming/widgets/success_screen.dart';
import 'package:tamweelytask/features/complaints/ui/submit_complaint_screen.dart';
import 'package:tamweelytask/features/contactUs/logic/contact_us_cubit.dart';
import 'package:tamweelytask/features/home/ui/home_screen.dart';
import 'package:tamweelytask/features/introduction/ui/welcome_screen.dart';
import 'package:tamweelytask/features/products/logic/products_cubit.dart';

import '../../features/aboutUs/ui/about_us_screen.dart';
import '../../features/contactUs/ui/contact_us_screen.dart';
import '../../features/introduction/ui/splash_screen.dart';
import '../../features/products/ui/product_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    /// this arguments to be passed to the next screen
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return _buildRoute(const SplashScreen());

      case Routes.welcomeScreen:
        return _buildRoute(const WelcomeScreen());


      case Routes.homeScreen:
        return _buildRoute(const HomeScreen());

      case Routes.contactUsScreen:
        return _buildRoute(BlocProvider(
          create: (_) => getIt<ContactUsCubit>(),
          child: const ContactUsScreen(),
        ));

      case Routes.successScreen:
        return _buildRoute(SuccessScreen(
          message: arguments as String,
        ));

      case Routes.productScreen:
        return _buildRoute(
            BlocProvider(
              create: (_) => getIt<ProductsCubit>(),
              child: const ProductScreen(),
            )
        );

      case Routes.submitComplaintScreen:
        return _buildRoute(
            const SubmitComplaintScreen()
        );
      case Routes.aboutUsScreen:
        return _buildRoute( AboutUsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined')),
          ),
        );
    }
  }

  // this function act as native navigation for android and ios
  Route _buildRoute(Widget page, {bool useCupertino = false}) {
    if (useCupertino || TargetPlatform.iOS == defaultTargetPlatform) {
      return CupertinoPageRoute(builder: (_) => page);
    } else {
      return MaterialPageRoute(
        builder: (_) => page,
      );
    }
  }
}
