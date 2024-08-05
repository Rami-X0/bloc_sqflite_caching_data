import 'package:bloc_sqflite_caching_data/core/helper/extension.dart';
import 'package:bloc_sqflite_caching_data/core/widgets/app_shimmer_loading.dart';
import 'package:bloc_sqflite_caching_data/features/home/data/models/products_response.dart';
import 'package:bloc_sqflite_caching_data/features/home/logic/product_home_bloc.dart';
import 'package:bloc_sqflite_caching_data/features/home/logic/product_home_state.dart';
import 'package:bloc_sqflite_caching_data/features/home/ui/widgets/product_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeProductBloc, HomeProductState>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return _loadingGetProducts(context);
        } else if (state is ProductSuccessState) {
          return _loadedGetProducts(state.productsResponse);
        } else if (state is ProductFailureState) {
          return Text(state.exception.toString());
        } else {
          return Container();
        }
      },
    );
  }

  Widget _loadingGetProducts(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: List.generate(
          5,
          ((index) => AppShimmerLoading(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.w * 0.0200),
                  child: Container(
                    width: context.w * 1,
                    height: context.h * 0.2,
                    margin: EdgeInsets.symmetric(vertical: context.h * 0.009),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(context.w * 0.02),
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor.withOpacity(0.2),
                          blurRadius: 5.0,
                          spreadRadius: 0.5,
                          offset: const Offset(-1, 10),
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }

  Widget _loadedGetProducts(ProductsResponse productsResponse) {
    return ListView.builder(
        addAutomaticKeepAlives: true,
        cacheExtent: productsResponse.products.length.toDouble(),
        itemCount: productsResponse.products.length,
        itemBuilder: (context, index) {
          return ProductViewItem(
            productsResponse: productsResponse,
            index: index,
          );
        });
  }
}
