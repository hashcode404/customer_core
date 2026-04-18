import 'package:customer_core/customer_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final config = AppConfig(
  applicationName: 'Le Arabia Customer',
  shopName: 'Le Arabia',
  shopId: '1',
  country: Country.uk,
  shopIdentifier: 'le-arabia',
  shopInfoEmail: 'info@learabia.co.uk',
  shopInfoPhone: ['+44 01245939257'],
  shopInfoAddress: '63 New Writtle Street, Chelmsford, CM2 0LF',
  buildIdentifier: 'co.uk.learabia.app',
  fireBaseProjectId: 'customerapp-6d5f7',
  themeData: ThemeData(),
  env: AppEnv.prod,
  secretKey: dotenv.env['SECRETKEY'] ?? '',
  fpSecretKey: dotenv.env['FPSECRETKEY'] ?? '',
  reservationSecretKey: dotenv.env['RESERVATIONSECRETKEY'] ?? '',
  stripeKey: dotenv.env['STRIPEKEY'] ?? '',
  logo: 'assets/images/freshden logo v3.png',
  bgImage: 'assets/images/urban spicebg.png',
  bannerImages: [
    "assets/images/freshden banner.png",
    "assets/images/freshden banner (1).png",
    "assets/images/freshden banner (2).png",
  ],
);