import 'package:flutter/material.dart';
import 'app_color.dart';

export 'app_font.dart';
export 'app_color.dart';

// Warna yang dipakai aplikasi
class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light(
        surface: AppColor.backgroundColor,
        primary: AppColor.primary2,
        secondary: AppColor.secondary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.backgroundColor,
      ),
      scaffoldBackgroundColor: AppColor.backgroundColor,
      iconTheme: const IconThemeData(
        color: AppColor.primary2,
      ));
}
