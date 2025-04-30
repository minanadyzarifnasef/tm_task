import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tamweelytask/features/contactUs/data/repo/contact_us_repo.dart';
import 'package:tamweelytask/features/contactUs/logic/contact_us_cubit.dart';

import '../networking/api_service.dart';
import '../networking/dio_factory.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //Contact Us
  getIt.registerLazySingleton<ContactUsRepo>(() => ContactUsRepo(getIt()));
  getIt.registerFactory<ContactUsCubit>(() => ContactUsCubit(getIt()));


}
