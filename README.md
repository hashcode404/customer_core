# customer_core

`customer_core` is a Flutter package for building a branded customer ordering
app. It provides the application shell, routing, dependency registration,
theme setup, Firebase notification initialization, Stripe configuration, and
ready-made customer flows for authentication, online ordering, checkout,
profiles, notifications, favourites, and table reservations.

## Features

- White-label `CustomerApp` entry point with brand, shop, country, and key
  configuration.
- Built-in AutoRoute navigation for splash, welcome, auth, home, ordering,
  cart, checkout, coupons, order history, reservations, profile, addresses,
  favourites, and notifications.
- Provider-based dependency registration through `DependencyRegistrar`.
- Firebase Cloud Messaging setup through `CustomerInitializer`.
- Stripe publishable key setup from `KeyConfig`.
- Light and dark theme overrides for common brand colors.
- Shared package assets for images, icons, and Lottie animations.

## Requirements

- Flutter SDK with Dart `^3.5.3`.
- Firebase configured in the host app.
- Platform notification permissions configured by the host app.
- Stripe publishable key when checkout payments are enabled.

## Installation

Add the package to your app. F

```yaml
dependencies:
  customer_core:
    git: 
    url: package_github_repo_url
```

Then install dependencies:

```sh
flutter pub get
```

## Setup

Initialize Flutter, Firebase, and `customer_core` before running the app.
`CustomerApp` receives the runtime configuration and builds the packaged app
experience.

```dart
import 'package:customer_core/customer_core.dart';
import 'package:customer_core/theme/customer_theme_override.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CustomerInitializer.init();

  runApp(
    CustomerApp(
      appConfig: appConfig,
      uiConfig: uiConfig,
      keyConfig: keyConfig,
      lightThemeOverride: const CustomerLightThemeOverride(
        primary: Colors.red,
        onSurface: Colors.black,
        disabledColor: Colors.grey,
      ),
      darkThemeOverride: const CustomerDarkThemeOverride(
        primary: Colors.red,
        onSurface: Colors.white,
        disabledColor: Colors.grey,
      ),
    ),
  );
}
```

## Configuration

Create app, UI, and key configuration objects in your host app.

```dart
import 'package:customer_core/customer_core.dart';

final appConfig = AppConfig(
  applicationName: 'Demo Customer',
  shopName: 'Demo Store',
  shopId: '1',
  shopIdentifier: 'demo-store',
  shopInfoEmail: 'info@example.com',
  shopInfoPhone: ['+44 01234567890'],
  shopInfoAddress: '1 Demo Street, London',
  buildIdentifier: 'com.example.demo',
  fireBaseProjectId: 'firebase-project-id',
  country: Country.uk,
  env: AppEnv.prod,
  themeMode: AppThemeMode.system,
);

final uiConfig = UiConfig(
  logo: 'assets/images/logo.png',
  bgImage: 'assets/images/background.png',
  bannerImages: [
    'assets/images/banner-1.png',
    'assets/images/banner-2.png',
  ],
);

final keyConfig = KeyConfig(
  secretKey: 'secret-key',
  fpSecretKey: 'fp-secret-key',
  reservationSecretKey: 'reservation-secret-key',
  stripeKey: 'stripe-publishable-key',
);
```

For real applications, keep keys outside source control and load them from your
preferred environment system before creating `KeyConfig`.

## Assets

The package declares its own assets under:

- `lib/assets/images/`
- `lib/assets/icons/`
- `lib/assets/lottie/`

Your host app should declare any app-specific images referenced by `UiConfig`
in its own `pubspec.yaml`.

## Notifications

`CustomerInitializer.init()` configures dependency injection, initializes the
notification provider, reads the FCM token, registers foreground and background
FCM handlers, stores received notifications locally, and locks the app to
portrait orientation.

Call it after `Firebase.initializeApp()` and before `runApp()`.

## Example

See the sample app in [`example/`](example/) for a complete setup, including
Firebase options, dotenv-based key loading, app configuration, UI assets, and
theme overrides.

Run it with:

```sh
cd example
flutter pub get
flutter run
```

## Development

Generate code after route, injectable, JSON, or asset changes:

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

Analyze the package:

```sh
flutter analyze
```

Run tests:

```sh
flutter test
```
