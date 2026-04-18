import 'package:customer_core/customer_core.dart';
import 'package:customer_core/src/application/theme/theme_provider.dart';
import 'package:customer_core/src/core/theme/app_theme.dart';
import 'package:customer_core/theme/customer_theme_override.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class CustomerApp extends StatefulWidget {
  final AppConfig config;
  final CustomerThemeOverride? themeOverride;

  const CustomerApp({super.key, required this.config, this.themeOverride});

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
    Stripe.publishableKey = widget.config.stripeKey;
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

    final baseLight = appLightTheme(context);
    final baseDark = appDarkTheme(context);

    ThemeData finalLight = baseLight;
    ThemeData finalDark = baseDark;

    if (widget.themeOverride != null) {
      final override = widget.themeOverride!;

      finalLight = baseLight.copyWith(
        colorScheme: baseLight.colorScheme.copyWith(
          primary: override.primary ?? baseLight.colorScheme.primary,
        ),
      );

      finalDark = baseDark.copyWith(
        colorScheme: baseDark.colorScheme.copyWith(
          primary: override.primary ?? baseDark.colorScheme.primary,
        ),
      );
    }

    return MaterialApp.router(
      title: widget.config.applicationName,
      debugShowCheckedModeBanner: false,
      theme: finalLight,
      darkTheme: finalDark,
      themeMode: ThemeMode.system, // change this 👈
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
