import 'package:customer_core/src/domain/store/models/favourite_product_data_model.dart';
import 'package:customer_core/src/domain/store/models/featured_popular_products_data_model.dart';
import 'package:customer_core/src/domain/store/models/product_details_pagination.dart';
import 'package:customer_core/src/domain/store/models/store_settings_data_model.dart';
import 'package:customer_core/src/domain/store/models/store_timing_data_model.dart';
import 'package:customer_core/src/infrastructure/core/failures/app_exceptions.dart';
import 'package:fpdart/fpdart.dart';

import 'models/product_category_model.dart';
import 'models/product_details_model.dart';
import 'models/store_delivery_slot_model.dart';

abstract class IStoreRepo {
  Future<Either<AppExceptions, ProductDetailsModel>> getProducts({
    required String categoryID,
  });

  Future<Either<AppExceptions, ProductCategoryModel>> getCategories();

  Future<Either<AppExceptions, StoreTimingDataModel>> getShopTimingDetails();

  Future<Either<AppExceptions, StoreSettingsDataModel>> getStoreSettings();

  Future<Either<AppExceptions, StoreDeliverySlotModel>> getStoreDeliverySlots();

  Future<Either<AppExceptions, FeaturedPopularProductsDataModel>>
      getFeaturedPopularProducts({required String shopID});

  Future<Either<AppExceptions, ProductDetailsPagination>>
      getProductsByPagination({
    required String categoryID,
    required String numberOfProducts,
    required String pageNumber,
  });

  Future<Either<AppExceptions, Map<String, dynamic>>> addFavourite(
      {required String productID});

  Future<Either<AppExceptions, String>> removeFavourite(
      {required String productID});

  Future<Either<AppExceptions, FavouriteProductRawDataModel>>
      getFavouriteProductList();
}
