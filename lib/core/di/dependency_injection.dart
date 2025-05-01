import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tamweelytask/features/complaints/data/repo/complaints_repo.dart';
import 'package:tamweelytask/features/complaints/logic/complaints_cubit.dart';
import 'package:tamweelytask/features/contactUs/data/repo/contact_us_repo.dart';
import 'package:tamweelytask/features/contactUs/logic/contact_us_cubit.dart';
import 'package:tamweelytask/features/products/data/repo/products_repo.dart';
import 'package:tamweelytask/features/products/logic/products_cubit.dart';

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

  //products
  getIt.registerLazySingleton<ProductsRepo>(() => ProductsRepo(getIt()));
  getIt.registerFactory<ProductsCubit>(() => ProductsCubit(getIt()));

  //complaints
  getIt.registerLazySingleton<ComplaintsRepo>(() => ComplaintsRepo(getIt()));
  getIt.registerFactory<ComplaintsCubit>(() => ComplaintsCubit(getIt()));


}
