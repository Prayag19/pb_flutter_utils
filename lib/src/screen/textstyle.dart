import 'dart:ui';
import 'package:flutter/material.dart';


import 'colors.dart';

class AppTextStyle {
  static AppTextStyle? _instance;
  AppTextStyle._();

  static AppTextStyle get instance => _instance ??= AppTextStyle._();

  TextStyle primaryTitle = const TextStyle(
      fontSize: 30.0,
      color: AppColor.primary,
      fontWeight: FontWeight.bold);

  TextStyle  whiteSubTitle = const TextStyle(
      fontSize: 22.0,
      color: AppColor.white,
      fontWeight: FontWeight.w700);

  TextStyle blackSubTitle = const TextStyle(
      fontSize: 22.0,
      color: AppColor.blackText,
      fontWeight: FontWeight.w700);

  TextStyle blackLabel = const TextStyle(
      fontSize: 14.0,
      color: AppColor.blackText,
      fontWeight: FontWeight.w600);

  TextStyle greyLabel = const TextStyle(
      fontSize: 15.0,
      color: AppColor.greyText,
      fontWeight: FontWeight.w600);

  TextStyle body = const TextStyle(
      fontSize: 18.0,
      color: AppColor.blackText,
      fontWeight: FontWeight.w400);

}
