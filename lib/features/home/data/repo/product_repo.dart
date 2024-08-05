import 'package:bloc_sqflite_caching_data/core/helper/dio_helper.dart';
import 'package:bloc_sqflite_caching_data/core/internet_connection/logic/internet_connection_bloc.dart';
import 'package:bloc_sqflite_caching_data/core/internet_connection/logic/internet_connection_state.dart';
import 'package:bloc_sqflite_caching_data/core/networking/api_constants.dart';
import 'package:bloc_sqflite_caching_data/features/home/data/models/products_response.dart';
import 'package:bloc_sqflite_caching_data/features/home/local/local_product_db.dart';
import 'package:dartz/dartz.dart';

class ProductRepo {
  final DioHelper _dioHelper;
  final LocalProductDB _localProductDB;
  final InternetConnectionBloc _internetConnectionBloc;

  ProductRepo(
      this._dioHelper, this._localProductDB, this._internetConnectionBloc);

  Future<Either<Exception, ProductsResponse>> getAllProducts() async {
    try {
      if (_internetConnectionBloc.state is ConnectedInternetState) {
print('connected');
        return await getAllProductsFromNetwork();
      } else {
        print('Not connected');
        return getAllProductsFromLocalDB();
      }
    } on Exception catch (failure) {
      return Left(failure);
    }
  }

  Future<Either<Exception, ProductsResponse>>
      getAllProductsFromNetwork() async {
    try {
      final response = await _dioHelper.getData(url: ApiConstants.allProducts);
      var productsResponse = ProductsResponse.fromJson(response.data);
      await _localProductDB.deleteAllProductsFromDB();
      Future.delayed(Duration.zero, () async {
        await _localProductDB.insertIntoDB(productsResponse);
      });

      return Right(productsResponse);
    } on Exception catch (failure) {
      return Left(failure);
    }
  }

  Future<Either<Exception, ProductsResponse>>
      getAllProductsFromLocalDB() async {
    try {
      final response = await _localProductDB.getAllProductsFromDB();
      var products = response.map((e) => Products.fromJson(e)).toList();
      var productsResponse = ProductsResponse(
        success: true,
        totalProducts: products.length,
        message: "Loaded from local DB",
        offset: 0,
        limit: products.length,
        products: products,
      );

      return Right(productsResponse);
    } on Exception catch (failure) {
      return Left(failure);
    }
  }
}
