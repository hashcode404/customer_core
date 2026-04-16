import 'package:customer_core/src/application/core/dependency_registrar.dart';
import 'package:customer_core/src/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:customer_core/src/presentation/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import 'core/config/app_config.dart';

class CustomerApp extends StatelessWidget {
  final AppConfig config;

  const CustomerApp({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    // initialize global config
    AppConfig.instance = config;
    DependencyRegistrar.initializeAllProviders(context);

    return MultiProvider(
      providers: DependencyRegistrar.providers,
      child: Builder(
        builder: (context) => _buildMaterialApp(context),
      ),
    );
  }

  Widget _buildMaterialApp(BuildContext context) {
    final _appRouter = AppRouter();

    return MaterialApp.router(
      title: config.appName,
      debugShowCheckedModeBanner: false,
      theme: config.themeData,
      routerConfig: _appRouter.config(),
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(0.95)),
            child: ToastificationWrapper(child: child!));
      },
    );
  }
}
