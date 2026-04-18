import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'application/notification/notification_provider.dart';
import 'domain/dependency_injection/injection_config.dart';

class CustomerInitializer {
  static Future<void> init(
    // {required String env}
    ) async {
    // WidgetsFlutterBinding.ensureInitialized();

    // Firebase
    // await Firebase.initializeApp();

    // Env
    // await dotenv.load(fileName: env == 'dev' ? ".env.dev" : ".env.prod");

    // Stripe
    // Stripe.publishableKey = dotenv.env['STRIPEKEY'] ?? '';

    // DI
    configureInjection();

    // Notifications
    await NotificationProvider().init();

    // Orientation
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}
