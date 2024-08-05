import 'package:flutter/material.dart';

@immutable
sealed class HomeProductEvent {}

final class GetAllProductsEvent extends HomeProductEvent {}

final class GetAllCachingProductsEvent extends HomeProductEvent {}
