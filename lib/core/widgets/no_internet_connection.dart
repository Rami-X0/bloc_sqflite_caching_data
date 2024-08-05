import 'package:bloc_sqflite_caching_data/core/helper/extension.dart';
import 'package:bloc_sqflite_caching_data/core/theming/styles.dart';
import 'package:flutter/material.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color textMediumColor =
        Theme.of(context).textTheme.bodyMedium!.color!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off_sharp,
              color: Colors.black54,
              size: context.w * 1 / 2,
            ),
            Text(
              'No Internet Connection',
              style: TextStyles.fontBlackMedium(context, Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
