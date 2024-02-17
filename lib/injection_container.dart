import 'package:dio/dio.dart';
import 'package:ecommerceapp/data/data-sources/remote/product_api_service.dart';
import 'package:ecommerceapp/data/repository/product_repository_impl.dart';
import 'package:ecommerceapp/domain/repository/product_repository.dart';
import 'package:ecommerceapp/domain/usecases/get_products.dart';
import 'package:ecommerceapp/presentation/login/bloc/bloc/login_bloc.dart';
import 'package:ecommerceapp/presentation/product/bloc/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  //dio
  sl.registerSingleton<Dio>(Dio());
//dependencies
  sl.registerSingleton<ProductAPIService>(ProductAPIService(sl()));

  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl(sl()));

  //usecase
  sl.registerSingleton<GetProductsUsecase>(GetProductsUsecase(sl()));

  //blocs
  sl.registerFactory<ProductBloc>(() => ProductBloc(sl()));

  sl.registerFactory<LoginBloc>(() => LoginBloc());
}
