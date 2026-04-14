import 'package:flutter/material.dart';

class AppConfig {
  static late AppConfig instance;

  final String appName;
  final String baseUrl;
  final ThemeData themeData;
  final String logo;

  AppConfig({
    required this.appName,
    required this.baseUrl,
    required this.themeData,
    required this.logo,
  });
}