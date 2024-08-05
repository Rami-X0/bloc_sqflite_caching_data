import 'package:bloc_sqflite_caching_data/core/di/dependency_injection.dart';
import 'package:bloc_sqflite_caching_data/core/helper/extension.dart';
import 'package:bloc_sqflite_caching_data/features/home/logic/product_home_bloc.dart';
import 'package:bloc_sqflite_caching_data/features/home/logic/product_home_event.dart';
import 'package:bloc_sqflite_caching_data/features/home/ui/widgets/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProductScreen extends StatelessWidget {
  const HomeProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeProductBloc>()..add(GetAllProductsEvent()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(context.h * 0.004),
          child: AppBar(),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: const SafeArea(
          child: ProductView(),
        ),
      ),
    );
  }
}
