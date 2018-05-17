import 'package:flutter/material.dart';

ThemeData appTheme = new ThemeData(
  primaryColor: Colors.amber[700],
);

class AppColors {
  static final Color lightText = Colors.grey[500];
}

class AppTextStyles {

  static final title = new TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );

  static final description = new TextStyle(
    fontSize: 14.0,
  );

  static final readMore = new TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w700,
    color: appTheme.primaryColor
  );

  static final tag = new TextStyle(
    fontSize: 10.0,
    color: AppColors.lightText
  );

  static final fundingRelevant = new TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
  );

  static final fundingInformative = new TextStyle(
      fontSize: 10.0,
      color: AppColors.lightText
  );

}