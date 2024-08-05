import 'package:bloc_sqflite_caching_data/core/helper/extension.dart';
import 'package:bloc_sqflite_caching_data/core/theming/app_theme.dart';
import 'package:bloc_sqflite_caching_data/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle fontBlackMedium(BuildContext context, Color color) =>
      TextStyle(
        color: color,
        fontWeight: FontWeightHelper.medium,
        fontSize: context.w * 0.05,


      );

  static TextStyle fontGreyMedium(BuildContext context) =>
      TextStyle(
        color: Colors.grey,
        fontWeight: FontWeightHelper.medium,
        fontSize: context.w * 0.0400,
      );

  static TextStyle fontWhiteMedium(BuildContext context) =>
      TextStyle(
        color: Colors.white,
        fontWeight: FontWeightHelper.medium,
        fontSize: context.w * 0.0330,
      );
}
