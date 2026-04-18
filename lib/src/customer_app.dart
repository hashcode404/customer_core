import 'package:customer_core/customer_core.dart';
import 'package:customer_core/src/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class CustomerApp extends StatefulWidget {
  final AppConfig config;

  const CustomerApp({super.key, required this.config});

  @override
  State<CustomerApp> createState() => _CustomerAppState();
}

class _CustomerAppState extends State<CustomerApp> {
  @override
  void initState() {
    super.initState();

    // initialize once
    AppConfig.instance = widget.config;
    AppEnvironment.current = widget.config.env;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: DependencyRegistrar.providers,
      child: Builder(
        builder: (context) {
          DependencyRegistrar.initializeAllProviders(context);

          return _buildMaterialApp(context);
        },
      ),
    );
  }

  Widget _buildMaterialApp(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      title: widget.config.applicationName,
      debugShowCheckedModeBanner: false,
      theme: appLightTheme(context),
      darkTheme: appDarkTheme(context),
      routerConfig: appRouter.config(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(0.95)),
          child: ToastificationWrapper(child: child!),
        );
      },
    );
  }
}
