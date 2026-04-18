import 'package:customer_core/src/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomerTheme {
  static ThemeData light(BuildContext context) => appLightTheme(context);
  static ThemeData dark(BuildContext context) => appDarkTheme(context);
}