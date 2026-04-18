import 'package:customer_core/customer_core.dart';
import 'package:customer_core/theme/customer_theme_override.dart';
import 'package:example/app_configuration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CustomerInitializer.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env.prod");
  runApp(
    CustomerApp(
      config: config,
      themeOverride: const CustomerThemeOverride(primary: Colors.red),
    ),
  );
}
