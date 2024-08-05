import 'package:bloc_sqflite_caching_data/core/di/dependency_injection.dart';
import 'package:bloc_sqflite_caching_data/core/internet_connection/logic/internet_connection_bloc.dart';
import 'package:bloc_sqflite_caching_data/core/internet_connection/logic/internet_connection_state.dart';
import 'package:bloc_sqflite_caching_data/core/theming/app_theme.dart';
import 'package:bloc_sqflite_caching_data/core/widgets/no_internet_connection.dart';
import 'package:bloc_sqflite_caching_data/features/home/ui/home_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
     SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:Theme.of(context).brightness,
      ),
    );

    return BlocProvider(
      create: (context) => getIt<InternetConnectionBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        darkTheme: AppTheme.darkMode,
        theme: AppTheme.lightMode,
        home: BlocBuilder<InternetConnectionBloc, InternetConnectionState>(
          builder: (context, state) {
            if (state is NotConnectedInternetState) {
              return state.isProductData
                  ? const HomeProductScreen()
                  : const NoInternetConnectionScreen();
            } else if (state is ConnectedInternetState) {
              return const HomeProductScreen();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
