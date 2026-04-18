import 'package:customer_core/src/core/config/app_env.dart';
import 'package:flutter/material.dart';

class AppConfig {
  static late AppConfig instance;

  final String applicationName;
  final String shopName;
  final String shopId;
  final String shopIdentifier;
  final String shopInfoEmail;
  final List<String> shopInfoPhone;
  final String shopInfoAddress;
  final String buildIdentifier;

  final String? fcmTopicId;
  final String fireBaseProjectId;

  final ThemeData themeData;
  final String logo;
  final AppEnv env;
  final List<String> bannerImages;
  final String secretKey;
  final String fpSecretKey;
  final String reservationSecretKey;
  final String stripeKey;
  final String bgImage;

  AppConfig({
    required this.applicationName,
    required this.shopName,
    required this.shopId,
    required this.shopIdentifier,
    required this.shopInfoEmail,
    required this.shopInfoPhone,
    required this.shopInfoAddress,
    required this.buildIdentifier,
     this.fcmTopicId,
    required this.fireBaseProjectId,
    required this.themeData,
    required this.logo,
    required this.env,
    required this.bannerImages,
    required this.secretKey,
    required this.fpSecretKey,
    required this.reservationSecretKey,
    required this.stripeKey,
    required this.bgImage,
  });
}
