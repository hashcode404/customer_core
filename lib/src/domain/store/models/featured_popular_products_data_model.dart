// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:customer_core/src/domain/store/models/product_details_model.dart';

class FeaturedPopularProductsDataModel {
  final List<ProductDataModel>? featuredProducts;
  final List<ProductDataModel>? popularProducts;
  FeaturedPopularProductsDataModel({
    this.featuredProducts = const [],
    this.popularProducts = const [],
  });

  FeaturedPopularProductsDataModel copyWith({
    List<ProductDataModel>? featuredProducts,
    List<ProductDataModel>? popularProducts,
  }) {
    return FeaturedPopularProductsDataModel(
      featuredProducts: featuredProducts ?? this.featuredProducts,
      popularProducts: popularProducts ?? this.popularProducts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'featuredProducts': featuredProducts?.map((x) => x.toMap()).toList(),
      'popularProducts': popularProducts?.map((x) => x.toMap()).toList(),
    };
  }

  factory FeaturedPopularProductsDataModel.fromMap(Map<String, dynamic> map) {
    return FeaturedPopularProductsDataModel(
      featuredProducts: map['featuredProducts'] != null
          ? List<ProductDataModel>.from(
              (map['featuredProducts'] as List<dynamic>).map<ProductDataModel?>(
                (x) => ProductDataModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      popularProducts: map['popularProducts'] != null
          ? List<ProductDataModel>.from(
              (map['popularProducts'] as List<dynamic>).map<ProductDataModel?>(
                (x) => ProductDataModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeaturedPopularProductsDataModel.fromJson(String source) =>
      FeaturedPopularProductsDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FeaturedPopularProductsDataModel(featuredProducts: $featuredProducts, popularProducts: $popularProducts)';

  @override
  bool operator ==(covariant FeaturedPopularProductsDataModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.featuredProducts, featuredProducts) &&
        listEquals(other.popularProducts, popularProducts);
  }

  @override
  int get hashCode => featuredProducts.hashCode ^ popularProducts.hashCode;
}
