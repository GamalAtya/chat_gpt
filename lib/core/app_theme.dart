import 'package:flutter/material.dart';

import 'colors/colors.dart';



final appTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
    ),
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    primaryColorDark: AppColors.darkBackgroundColor,
    secondaryHeaderColor: AppColors.secondaryColor,
    highlightColor: AppColors.lightWhite,
    disabledColor: AppColors.grey,
    canvasColor: AppColors.white,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.primaryColor),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.secondaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: AppColors.primaryColor),
        iconColor: AppColors.secondaryColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(8),
        )));
