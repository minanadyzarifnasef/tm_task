import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasources/api_service.dart';
import '../../data/datasources/dio_factory.dart';
import '../../data/repositories/complaints_repo.dart';
import '../../data/repositories/contact_us_repo.dart';
import '../../data/repositories/products_repo.dart';
import '../../presentation/view_models/complaints/complaints_cubit.dart';
import '../../presentation/view_models/contact_us/contact_us_cubit.dart';
import '../../presentation/view_models/products/products_cubit.dart';
import '../services/navigation_service.dart';



final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //navigation
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());

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
