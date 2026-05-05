import 'package:auto_route/auto_route.dart';
import 'package:customer_core/customer_core.dart';
import 'package:flutter/material.dart';
import 'package:customer_core/src/core/theme/app_colors.dart';


@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      DependencyRegistrar.initializeAllProviders(context);
      context.replaceRoute(const OrderOnlineScreenRoute());

      // Future.delayed(const Duration(seconds: 2), () {
      //   context.read<AuthProvider>().checkUserIsLogged().then((isLogged) {
      //     if (isLogged) {
      //       DependencyRegistrar.initializeAllProviders(context);
      //       context.replaceRoute(OrderOnlineScreenRoute());
      //       // context.read<ProductsProvider>().getAllCategories();
      //     } else {
      //       context.replaceRoute(const WelcomeScreenRoute());
      //     }
      //   });
      // });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          // image: DecorationImage(
          //   image: AssetImage(Assets.images.pattern.path),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Center(
          child: Image.asset(
            UiConfig.instance.logo,
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
      ),
    );
  }
}
