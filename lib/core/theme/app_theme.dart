import 'package:flutter/material.dart';
import 'package:stream_video_app/core/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: AppColors.backgroundColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
  );
}
