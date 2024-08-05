import 'package:bloc_sqflite_caching_data/core/helper/extension.dart';
import 'package:bloc_sqflite_caching_data/features/home/data/models/products_response.dart';
import 'package:bloc_sqflite_caching_data/features/home/ui/widgets/product_image.dart';
import 'package:bloc_sqflite_caching_data/features/home/ui/widgets/product_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductViewItem extends StatelessWidget {
  final ProductsResponse productsResponse;
  final int index;
  const ProductViewItem({super.key, required this.productsResponse, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.w * 0.02),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: context.h * 0.009),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.w * 0.05),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.2),
              blurRadius: 5.0,
              spreadRadius: 0.5,
              offset: const Offset(-1, 10),
            )
          ],
        ),
        child: Row(
          children: [
             ProductImage(productsResponse: productsResponse, index:index,),
            Gap(context.w * 0.015),
             ProductText(productsResponse: productsResponse, index:index,),
          ],
        ),
      ),
    );
  }
}
