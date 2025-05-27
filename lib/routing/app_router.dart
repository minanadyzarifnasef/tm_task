import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamweelytask/core/theming/widgets/success_screen.dart';
import 'package:tamweelytask/routing/routes.dart';

import '../core/di/dependency_injection.dart';
import '../presentation/view_models/contact_us/contact_us_cubit.dart';
import '../presentation/view_models/products/products_cubit.dart';
import '../presentation/views/complaints/submit_complaint_screen.dart';
import '../presentation/views/contact_us/contact_us_screen.dart';
import '../presentation/views/home/home_screen.dart';
import '../presentation/views/introduction/splash_screen.dart';
import '../presentation/views/introduction/welcome_screen.dart';
import '../presentation/views/product/product_screen.dart';


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
