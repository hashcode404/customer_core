// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:customer_core/src/application/auth/auth_provider.dart' as _i144;
import 'package:customer_core/src/application/cart/cart_provider.dart' as _i651;
import 'package:customer_core/src/application/home/home_provider.dart' as _i137;
import 'package:customer_core/src/application/notification/notification_provider.dart'
    as _i505;
import 'package:customer_core/src/application/order/order_provider.dart'
    as _i797;
import 'package:customer_core/src/application/payment/payment_provider.dart'
    as _i623;
import 'package:customer_core/src/application/products/products_provider.dart'
    as _i916;
import 'package:customer_core/src/application/promotion/promotions_provider.dart'
    as _i795;
import 'package:customer_core/src/application/search/search_provider.dart'
    as _i821;
import 'package:customer_core/src/application/shop/shop_provider.dart' as _i440;
import 'package:customer_core/src/application/table/table_provider.dart'
    as _i491;
import 'package:customer_core/src/application/theme/theme_provider.dart'
    as _i620;
import 'package:customer_core/src/application/user/user_provider.dart' as _i861;
import 'package:customer_core/src/domain/cart/i_cart_repo.dart' as _i761;
import 'package:customer_core/src/domain/checkout/i_checkout_repo.dart'
    as _i734;
import 'package:customer_core/src/domain/offer/i_offer_repo.dart' as _i381;
import 'package:customer_core/src/domain/promotion/i_promotion_repo.dart'
    as _i1046;
import 'package:customer_core/src/domain/search/i_search_repo.dart' as _i32;
import 'package:customer_core/src/domain/store/i_store_repo.dart' as _i255;
import 'package:customer_core/src/domain/table/i_table_repo.dart' as _i144;
import 'package:customer_core/src/domain/user/i_user_repo.dart' as _i357;
import 'package:customer_core/src/domain/user/i_user_shared_prefs.dart'
    as _i198;
import 'package:customer_core/src/infrastructure/cart/cart_repo.dart' as _i656;
import 'package:customer_core/src/infrastructure/checkout/checkout_repo.dart'
    as _i742;
import 'package:customer_core/src/infrastructure/offer/offer_repo.dart'
    as _i955;
import 'package:customer_core/src/infrastructure/promotions/promotions_repo.dart'
    as _i823;
import 'package:customer_core/src/infrastructure/search/search_repo.dart'
    as _i785;
import 'package:customer_core/src/infrastructure/store/store_repo.dart'
    as _i533;
import 'package:customer_core/src/infrastructure/table/table_repo.dart' as _i21;
import 'package:customer_core/src/infrastructure/user/user_repo.dart' as _i731;
import 'package:customer_core/src/infrastructure/user/user_shared_prefs_repo.dart'
    as _i1051;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i137.HomeProvider>(() => _i137.HomeProvider());
    gh.lazySingleton<_i505.NotificationProvider>(
        () => _i505.NotificationProvider());
    gh.lazySingleton<_i620.ThemeProvider>(() => _i620.ThemeProvider());
    gh.lazySingleton<_i357.IUserRepo>(() => _i731.UserRepo());
    gh.lazySingleton<_i198.IUserSharedPrefsRepo>(
        () => _i1051.UserSharedPrefsRepo());
    gh.lazySingleton<_i144.ITableRepo>(() => _i21.TableRepo());
    gh.lazySingleton<_i144.AuthProvider>(() => _i144.AuthProvider(
          userRepository: gh<_i357.IUserRepo>(),
          sharedPrefsRepository: gh<_i198.IUserSharedPrefsRepo>(),
        ));
    gh.lazySingleton<_i255.IStoreRepo>(() => _i533.StoreRepo());
    gh.lazySingleton<_i734.ICheckoutRepo>(() => _i742.CheckoutRepo());
    gh.lazySingleton<_i761.ICartRepo>(() => _i656.CartRepo());
    gh.lazySingleton<_i1046.IPromotionRepo>(() => _i823.PromotionsRepo());
    gh.lazySingleton<_i32.ISearchRepo>(() => _i785.SearchRepo());
    gh.lazySingleton<_i381.IOfferRepo>(() => _i955.OfferRepo());
    gh.lazySingleton<_i797.OrderProvider>(() => _i797.OrderProvider(
          userRepo: gh<_i357.IUserRepo>(),
          sharedPrefsRepository: gh<_i198.IUserSharedPrefsRepo>(),
        ));
    gh.lazySingleton<_i861.UserProvider>(() => _i861.UserProvider(
          userRepo: gh<_i357.IUserRepo>(),
          sharedPrefsRepository: gh<_i198.IUserSharedPrefsRepo>(),
        ));
    gh.lazySingleton<_i821.SearchProvider>(
        () => _i821.SearchProvider(searchRepo: gh<_i32.ISearchRepo>()));
    gh.lazySingleton<_i916.ProductsProvider>(() => _i916.ProductsProvider(
          storeRepo: gh<_i255.IStoreRepo>(),
          sharedPrefsRepository: gh<_i198.IUserSharedPrefsRepo>(),
        ));
    gh.lazySingleton<_i491.TableProvider>(() => _i491.TableProvider(
          tableRepo: gh<_i144.ITableRepo>(),
          userSharedPrefsRepo: gh<_i198.IUserSharedPrefsRepo>(),
        ));
    gh.factory<_i795.PromotionsProvider>(
        () => _i795.PromotionsProvider(gh<_i1046.IPromotionRepo>()));
    gh.lazySingleton<_i440.ShopProvider>(
        () => _i440.ShopProvider(gh<_i255.IStoreRepo>()));
    gh.lazySingleton<_i623.PaymentProvider>(
        () => _i623.PaymentProvider(checkoutRepo: gh<_i734.ICheckoutRepo>()));
    gh.lazySingleton<_i651.CartProvider>(() => _i651.CartProvider(
          cartRepo: gh<_i761.ICartRepo>(),
          checkRepo: gh<_i734.ICheckoutRepo>(),
          offerRepo: gh<_i381.IOfferRepo>(),
          sharedPrefsRepository: gh<_i198.IUserSharedPrefsRepo>(),
        ));
    return this;
  }
}
