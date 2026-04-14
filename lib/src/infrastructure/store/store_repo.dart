import 'dart:convert';

import 'package:customer_core/src/domain/store/models/favourite_product_data_model.dart';
import 'package:customer_core/src/domain/store/models/featured_popular_products_data_model.dart';
import 'package:customer_core/src/domain/store/models/product_details_pagination.dart';
import 'package:customer_core/src/domain/store/models/store_delivery_slot_model.dart';
import 'package:dio/dio.dart';
import 'package:customer_core/src/core/constants/app_identifiers.dart';
import 'package:customer_core/src/domain/store/models/product_category_model.dart';
import 'package:customer_core/src/domain/store/models/product_details_model.dart';
import 'package:customer_core/src/domain/store/models/store_settings_data_model.dart';
import 'package:customer_core/src/domain/store/models/store_timing_data_model.dart';
import 'package:customer_core/src/infrastructure/core/api_manager/api_manager.dart';
import 'package:customer_core/src/infrastructure/core/end_points/end_points.dart';
import 'package:customer_core/src/infrastructure/core/failures/app_exceptions.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../domain/store/i_store_repo.dart';

@LazySingleton(as: IStoreRepo)
class StoreRepo implements IStoreRepo {
  @override
  Future<Either<AppExceptions, ProductCategoryModel>> getCategories() async {
    try {
      final response = await APIManager.get(
        api: Endpoints.kListParentCategories,
        params: '/${AppIdentifiers.kShopId}-SHOP',
      );
      if (response == null) return Left(InternalServerErrorException());
      return Right(ProductCategoryModel.fromJson(response));
    } on DioException catch (e) {
      return Left(e.error is AppExceptions
          ? e.error as AppExceptions
          : InternalServerErrorException());
    } catch (_) {
      return Left(InternalServerErrorException());
    }
  }

  @override
  Future<Either<AppExceptions, ProductDetailsModel>> getProducts(
      {required String categoryID}) async {
    try {
      final response = await APIManager.get(
        api: Endpoints.kListProductsByCategory,
        params: '/${AppIdentifiers.kShopId}/$categoryID',
      );
      if (response == null) return Left(InternalServerErrorException());

      return Right(ProductDetailsModel.fromJson(response));
    } on DioException catch (e) {
      return Left(e.error is AppExceptions
          ? e.error as AppExceptions
          : InternalServerErrorException());
    } catch (_) {
      return Left(InternalServerErrorException());
    }
  }

  @override
  Future<Either<AppExceptions, StoreTimingDataModel>>
      getShopTimingDetails() async {
    try {
      final response = await APIManager.get(
        api: Endpoints.kRetrieveShopTiming,
        params: AppIdentifiers.kShopId,
      );
      if (response == null) return Left(InternalServerErrorException());

      final shopTimeRawData = jsonDecode(response);
      final shopTimeResponse = shopTimeRawData["shopTiming"];
      final shopTimingString = jsonEncode(shopTimeResponse);

      return Right(StoreTimingDataModel.fromJson(shopTimingString));
    } on DioException catch (e) {
      return Left(e.error is AppExceptions
          ? e.error as AppExceptions
          : InternalServerErrorException());
    } catch (_) {
      return Left(InternalServerErrorException());
    }
  }

  @override
  Future<Either<AppExceptions, StoreSettingsDataModel>>
      getStoreSettings() async {
    try {
      final response = await APIManager.get(
        api: Endpoints.kRetrieveShopSettings,
        params: AppIdentifiers.kShopIdentifier,
      );
      if (response == null) return Left(InternalServerErrorException());
      return Right(StoreSettingsDataModel.fromJson(response));
    } on DioException catch (e) {
      return Left(e.error is AppExceptions
          ? e.error as AppExceptions
          : InternalServerErrorException());
    } catch (_) {
      return Left(InternalServerErrorException());
    }
  }

  @override
  Future<Either<AppExceptions, StoreDeliverySlotModel>>
      getStoreDeliverySlots() async {
    try {
      final response = await APIManager.get(
          api: Endpoints.kShopDeliverySlots, params: AppIdentifiers.kShopId);
      if (response == null) return Left(InternalServerErrorException());
      return Right(StoreDeliverySlotModel.fromJson(response));
    } on DioException catch (e) {
      return Left(e.error is AppExceptions
          ? e.error as AppExceptions
          : InternalServerErrorException());
    } catch (_) {
      return Left(InternalServerErrorException());
    }
  }

  @override
  Future<Either<AppExceptions, ProductDetailsPagination>>
      getProductsByPagination({
    required String categoryID,
    required String numberOfProducts,
    required String pageNumber,
  }) async {
    try {
      final data = {
        "shopId": AppIdentifiers.kShopId,
        "dishesPerPage": numberOfProducts,
        "pageNumber": pageNumber,
        "categoryId": categoryID,
        "type": "online",
      };
      final response = await APIManager.post(
        api: Endpoints.kProductsPagination,
        data: data,
      );
      if (response == null) return Left(InternalServerErrorException());
      return Right(ProductDetailsPagination.fromJson(response));
    } on DioException catch (e) {
      return Left(e.error is AppExceptions
          ? e.error as AppExceptions
          : InternalServerErrorException());
    } catch (_) {
      return Left(InternalServerErrorException());
    }
  }

  @override
  Future<Either<AppExceptions, Map<String, dynamic>>> addFavourite(
      {required String productID}) {
    try {
      final data = {
        "type": "Product",
        "itemID": productID,
      };
      return APIManager.post(
        api: Endpoints.kMakeFavourite,
        needAuth: true,
        data: data,
      ).then((response) {
        if (response == null) return Left(InternalServerErrorException());
        final decodedData = jsonDecode(response);
        return Right(decodedData);
      });
    } on DioException catch (e) {
      return Future.value(Left(e.error is AppExceptions
          ? e.error as AppExceptions
          : InternalServerErrorException()));
    } catch (_) {
      return Future.value(Left(InternalServerErrorException()));
    }
  }

  @override
  Future<Either<AppExceptions, String>> removeFavourite(
      {required String productID}) {
    try {
      return APIManager.delete(
        api: "${Endpoints.kDeleteFavourite}/$productID",
        needAuthentication: true,
      ).then((response) {
        if (response == null) return Left(InternalServerErrorException());
        final decodedData = jsonDecode(response);
        return Right(decodedData["message"]);
      });
    } on DioException catch (e) {
      return Future.value(Left(e.error is AppExceptions
          ? e.error as AppExceptions
          : InternalServerErrorException()));
    } catch (_) {
      return Future.value(Left(InternalServerErrorException()));
    }
  }

  @override
  Future<Either<AppExceptions, FavouriteProductRawDataModel>>
      getFavouriteProductList() {
    try {
      return APIManager.get(
        api: Endpoints.kFavouriteList,
        needAuth: true,
      ).then((response) {
        if (response == null) {
          return Left(InternalServerErrorException());
        }
        return Right(FavouriteProductRawDataModel.fromJson(response));
      });
    } on DioException catch (e) {
      return Future.value(Left(e.error is AppExceptions
          ? e.error as AppExceptions
          : InternalServerErrorException()));
    } catch (_) {
      return Future.value(Left(InternalServerErrorException()));
    }
  }

  @override
  Future<Either<AppExceptions, FeaturedPopularProductsDataModel>>
      getFeaturedPopularProducts({required String shopID}) {
    try {
      return APIManager.get(
        api: "${Endpoints.kDashBoardContents}$shopID",
        needAuth: false,
      ).then((response) {
        if (response == null) {
          return Left(InternalServerErrorException());
        }
        return Right(FeaturedPopularProductsDataModel.fromJson(response));
      });
    } on DioException catch (e) {
      return Future.value(Left(e.error is AppExceptions
          ? e.error as AppExceptions
          : InternalServerErrorException()));
    } catch (_) {
      return Future.value(Left(InternalServerErrorException()));
    }
  }
}
