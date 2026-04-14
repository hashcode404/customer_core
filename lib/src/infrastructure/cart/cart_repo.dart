import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:customer_core/src/domain/cart/i_cart_repo.dart';
import 'package:customer_core/src/domain/cart/models/cart_details_model.dart';
import 'package:customer_core/src/infrastructure/core/api_manager/api_manager.dart';
import 'package:customer_core/src/infrastructure/core/end_points/end_points.dart';
import 'package:customer_core/src/infrastructure/core/failures/app_exceptions.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../domain/cart/models/add_product_cart_request_model.dart';

@LazySingleton(as: ICartRepo)
class CartRepo implements ICartRepo {
  @override
  Future<Option> addCartItem(AddProductCartRequestDataModel cartItem,
      bool isGuest, String? guestID, String? userID) async {
    try {
      final response = await APIManager.post(
        api: Endpoints.kWebAddToCart,
        data: cartItem.toJson2(),
        needAuth: !isGuest,
        additionalHeaders: isGuest ? {"user": guestID} : {"user": userID},
      );
      if (response == null) {
        return Option<AppExceptions>.of(InternalServerErrorException());
      }
      return const Option.none();
    } on DioException catch (e) {
      return Option.of(e.error is AppExceptions
          ? e.error as AppExceptions
          : InternalServerErrorException());
    } catch (_) {
      return Option.of(InternalServerErrorException());
    }
  }

  @override
  Future<Option> clearCart(
      {required bool isGuest, String? guestID, String? userID}) async {
    try {
      final response = await APIManager.delete(
        api: Endpoints.kWebClearCart,
        needAuthentication: !isGuest,
        additionalHeaders: isGuest ? {"user": guestID} : {"user": userID},
      );
      if (response == null) {
        return Option<AppExceptions>.of(InternalServerErrorException());
      }
      return const Option.none();
    } on DioException catch (e) {
      return Option.of(e.error is AppExceptions
          ? e.error as AppExceptions
          : InternalServerErrorException());
    } catch (_) {
      return Option.of(InternalServerErrorException());
    }
  }

  @override
  Future<Option> deleteCartItem(
      {required String id,
      required bool isGuest,
      String? guestID,
      String? userID}) async {
    try {
      final response = await APIManager.delete(
        api: "${Endpoints.kWebDeleteCartItem}/$id",
        needAuthentication: !isGuest,
        additionalHeaders: isGuest ? {"user": guestID} : {"user": userID},
      );
      if (response == null) {
        return Option<AppExceptions>.of(InternalServerErrorException());
      }
      return const Option.none();
    } on DioException catch (e) {
      return Option.of(e.error is AppExceptions
          ? e.error as AppExceptions
          : InternalServerErrorException());
    } catch (_) {
      return Option.of(InternalServerErrorException());
    }
  }

  @override
  Future<Either<AppExceptions, CartDetailsModel>> listCartItems(
      {required bool isGuest, String? guestID, String? userID}) async {
    try {
      final response = await APIManager.get(
        api: Endpoints.kWebListCartItems,
        needAuth: !isGuest,
        additionalHeaders:
            isGuest && guestID != null ? {"user": guestID} : {"user": userID!},
      );
      log(response.toString());

      if (response == null) {
        return Left(InternalServerErrorException());
      }
      final fromResponse =
          CartDetailsModel.fromMap(jsonDecode(response)["data"]);
      return Right(fromResponse);
    } on DioException catch (e) {
      return Left(e.error is AppExceptions
          ? e.error as AppExceptions
          : InternalServerErrorException());
    } catch (_) {
      return Left(InternalServerErrorException());
    }
  }

  @override
  Future<Option> updateCartItem(
      String cartItemId, AddProductCartRequestDataModel cartItem,
      {required bool isGuest, String? guestID, String? userID}) async {
    try {
      log(cartItem.toJson(), name: "Payload");
      final response = await APIManager.put(
        api: "${Endpoints.kWebUpdateCartItem}/$cartItemId",
        data: cartItem.toJson2(),
        needAuthentication: !isGuest,
        additionalHeaders:
            isGuest && guestID != null ? {"user": guestID} : {"user": userID},
      );
      if (response == null) {
        return Option<AppExceptions>.of(InternalServerErrorException());
      }
      return const Option.none();
    } on DioException catch (e) {
      return Option.of(e.error is AppExceptions
          ? e.error as AppExceptions
          : InternalServerErrorException());
    } catch (_) {
      return Option.of(InternalServerErrorException());
    }
  }

  @override
  Future<Either<AppExceptions, Option>> transferCart(
      {required String? guestID, required String? userID}) async {
    try {
      final response = await APIManager.post(
        api: Endpoints.kWebTransferGuestCart,
        data: {"guestId": guestID},
        additionalHeaders: {"user": userID},
      );
      if (response == null) {
        return Left(InternalServerErrorException());
      }
      return const Right(Option.none());
    } on DioException catch (e) {
      return left(e.error is AppExceptions
          ? e.error as AppExceptions
          : InternalServerErrorException());
    } catch (_) {
      return left(InternalServerErrorException());
    }
  }
}
