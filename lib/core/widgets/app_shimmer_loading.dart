import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmerLoading extends StatelessWidget {
  final Widget child;

  const AppShimmerLoading({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).scaffoldBackgroundColor,
      highlightColor: Colors.grey,
      child: child,
    );
  }
}
