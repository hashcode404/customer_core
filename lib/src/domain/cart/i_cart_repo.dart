import 'package:customer_core/src/domain/cart/models/cart_details_model.dart';
import 'package:customer_core/src/infrastructure/core/failures/app_exceptions.dart';
import 'package:fpdart/fpdart.dart';

import 'models/add_product_cart_request_model.dart';

abstract class ICartRepo {
  Future<Either<AppExceptions, CartDetailsModel>> listCartItems(
      {required bool isGuest, String? guestID, String? userID});

  Future<Option> addCartItem(AddProductCartRequestDataModel cartItem,
      bool isGuest, String? guestID, String? userID);

  Future<Option> updateCartItem(
      String cartItemId, AddProductCartRequestDataModel cartItem,
      {required bool isGuest, String? guestID, String? userID});

  Future<Option> deleteCartItem(
      {required String id,
      required bool isGuest,
      String? guestID,
      String? userID});

  Future<Option> clearCart(
      {required bool isGuest, String? guestID, String? userID});

  Future<Either<AppExceptions, Option>> transferCart(
      {required String? guestID, required String? userID});
}
