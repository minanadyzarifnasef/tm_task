import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamweelytask/features/complaints/logic/complaints_cubit.dart';
import 'package:tamweelytask/tamweely_app.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupGetIt();

  runApp(
      MultiBlocProvider(providers: [
        BlocProvider(
          create: (_) => getIt<ComplaintsCubit>(),

        )
      ], child: EasyLocalization(
        supportedLocales: const [
          Locale(
            'en',
          ),
          Locale(
            'ar',
          ),
        ],
        saveLocale: true,
        //startLocale: Locale(AppUtilities().languageCode),
        path: 'assets/translations',
        //fallbackLocale: Locale(AppUtilities().languageCode,''),
        child: TamweelyApp(
          appRouter: AppRouter(),
        ),
      ))
  );
}
