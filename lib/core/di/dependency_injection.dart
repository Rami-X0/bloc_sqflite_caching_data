import 'package:bloc_sqflite_caching_data/core/helper/dio_helper.dart';
import 'package:bloc_sqflite_caching_data/core/internet_connection/logic/internet_connection_bloc.dart';
import 'package:bloc_sqflite_caching_data/features/home/data/repo/product_repo.dart';
import 'package:bloc_sqflite_caching_data/features/home/local/local_product_db.dart';
import 'package:bloc_sqflite_caching_data/features/home/logic/product_home_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

/// this Method[GetIt] Is Create Dependency Injection
void initGetIt() {
  // dio helper
  getIt.registerLazySingleton<DioHelper>(() => DioHelper(Dio()));
  // product repo
  getIt.registerLazySingleton<ProductRepo>(
      () => ProductRepo(getIt(), getIt(), getIt()));
  // local DB
  getIt.registerLazySingleton<LocalProductDB>(() => LocalProductDB());
//home product bloc
  getIt.registerFactory<HomeProductBloc>(() => HomeProductBloc(getIt()));
//internet connection bloc
  getIt.registerLazySingleton<InternetConnectionBloc>(
      () => InternetConnectionBloc(getIt()));
}
