import 'package:flutter/material.dart';

extension  MediaQueryExtension on BuildContext {

  double get h => MediaQuery.of(this).size.height;
  double get w => MediaQuery.of(this).size.width;
}