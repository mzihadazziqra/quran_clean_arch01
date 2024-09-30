import 'package:flutter/material.dart';

import '../theme/app_color.dart';

// Snackbar aplikasi
void showSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(content),
        backgroundColor: AppColor.primary2,
      ),
    );
}
