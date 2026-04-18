import 'package:customer_core/gen/assets.gen.dart';
import 'package:customer_core/src/application/home/home_provider.dart';
import 'package:customer_core/src/application/order/order_provider.dart';
import 'package:customer_core/src/core/theme/app_colors.dart';
import 'package:customer_core/src/core/theme/custom_text_styles.dart';
import 'package:customer_core/src/core/utils/ui_utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/routes.gr.dart';

@RoutePage()
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 250,
              child: Assets.lib.assets.lottie.successCircleCheck.lottie(
                  delegates: LottieDelegates(values: [
                ValueDelegate.color(
                  ['**'],
                  value: Theme.of(context).colorScheme.primary,
                ),
                ValueDelegate.strokeColor(
                  ['**'],
                  value: AppColors.kWhite,
                ),
              ])),
            ),
          ),
          verticalSpaceRegular,
          Text(
            'Order Created Successfully',
            style: context.customTextTheme.text20W600,
          ),
          verticalSpaceSmall,
          Text(
            "Your order has been created successfully.\n We'll keep you updated on your order.",
            style: context.customTextTheme.text14W500
                .copyWith(color: AppColors.kGray3),
            textAlign: TextAlign.center,
          ),
          verticalSpaceRegular,
          verticalSpaceRegular,
          verticalSpaceRegular,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      side:  WidgetStatePropertyAll(
                        BorderSide(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      foregroundColor:  WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.primary,
                      ),
                      padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      ),
                    ),
                    onPressed: () {
                      context.router.replaceAll([
                        const OrderOnlineScreenRoute(),
                      ]);
                      context.read<HomeProvider>().onChangeCurrentPage(2);
                      context.read<OrderProvider>().fetchAllOrders();
                    },
                    child: Text(
                      'View Orders',
                      style: context.customTextTheme.text14W700,
                    ),
                  ),
                ),
                verticalSpaceRegular,
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      side:  WidgetStatePropertyAll(
                        BorderSide(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      foregroundColor: const WidgetStatePropertyAll(
                        AppColors.kBlack,
                      ),
                      padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      ),
                    ),
                    onPressed: () {
                      context.router.replaceAll([
                        const OrderOnlineScreenRoute(),
                      ]);
                      context.read<HomeProvider>().onChangeCurrentPage(0);
                      context.read<OrderProvider>().fetchAllOrders();
                    },
                    child: Text(
                      'Continue Shopping',
                      style: context.customTextTheme.text14W700,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
