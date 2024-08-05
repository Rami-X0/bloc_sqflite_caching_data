import 'package:bloc_sqflite_caching_data/core/helper/extension.dart';
import 'package:bloc_sqflite_caching_data/core/widgets/app_cached_network_image.dart';
import 'package:bloc_sqflite_caching_data/features/home/data/models/products_response.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
final ProductsResponse productsResponse;
final int index;
const ProductImage({super.key, required this.productsResponse, required this.index});

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: context.w * 0.4,
      height: context.h * 0.2,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(context.w * 0.05),

      ),

      child:  AppCachedNetworkImage(
          fitImage: BoxFit.cover,
          imageUrl:productsResponse.products[index].photoUrl)
    );
  }
}
