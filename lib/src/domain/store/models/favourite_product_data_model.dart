// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:customer_core/src/domain/store/models/product_details_model.dart';

class FavouriteProductRawDataModel {
  final FavouriteProductDataModel? favouriteList;

  FavouriteProductRawDataModel({
    this.favouriteList,
  });

  FavouriteProductRawDataModel copyWith({
    FavouriteProductDataModel? favouriteList,
  }) {
    return FavouriteProductRawDataModel(
      favouriteList: favouriteList ?? this.favouriteList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'favouriteList': favouriteList?.toMap(),
    };
  }

  factory FavouriteProductRawDataModel.fromMap(Map<String, dynamic> map) {
    return FavouriteProductRawDataModel(
      favouriteList: map['favouriteList'] != null
          ? FavouriteProductDataModel.fromMap(
              map['favouriteList'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FavouriteProductRawDataModel.fromJson(String source) =>
      FavouriteProductRawDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FavouriteProductRawDataModel(favouriteList: $favouriteList)';

  @override
  bool operator ==(covariant FavouriteProductRawDataModel other) {
    if (identical(this, other)) return true;

    return other.favouriteList == favouriteList;
  }

  @override
  int get hashCode => favouriteList.hashCode;
}

class FavouriteProductDataModel {
  final List<ProductDataModel> productList;

  FavouriteProductDataModel({
    required this.productList,
  });

  FavouriteProductDataModel copyWith({
    List<ProductDataModel>? productList,
  }) {
    return FavouriteProductDataModel(
      productList: productList ?? this.productList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productList': productList.map((x) => x.toMap()).toList(),
    };
  }

  factory FavouriteProductDataModel.fromMap(Map<String, dynamic> map) {
    return FavouriteProductDataModel(
      productList: List<ProductDataModel>.from(
        (map['ProductList'] as List<dynamic>).map<ProductDataModel>(
          (x) => ProductDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory FavouriteProductDataModel.fromJson(String source) =>
      FavouriteProductDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FavouriteProductDataModel(productList: $productList)';

  @override
  bool operator ==(covariant FavouriteProductDataModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.productList, productList);
  }

  @override
  int get hashCode => productList.hashCode;
}
