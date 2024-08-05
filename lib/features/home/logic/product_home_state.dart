import 'package:bloc_sqflite_caching_data/features/home/data/models/products_response.dart';
import 'package:flutter/material.dart';

@immutable
sealed class HomeProductState {}

final class HomeInitialState extends HomeProductState {}

final class ProductLoadingState extends HomeProductState {}

final class ProductSuccessState extends HomeProductState {
  final ProductsResponse productsResponse;

  ProductSuccessState(this.productsResponse);
}

final class ProductFailureState extends HomeProductState {
  final Exception exception;

  ProductFailureState(this.exception);
}

//
