// flutter imports
import 'package:flutter/cupertino.dart';

// third party imports
import 'package:equatable/equatable.dart';

@immutable
class ProductModel extends Equatable {
  final int id;
  final String discount;
  final List<String> images;
  final String name;
  final String price;
  final String originalPrice;
  final String deliveryInfoLine1;
  final String deliveryInfoLine2;
  final String detail;
  final int count;

  ProductModel(
      {this.id = 0,
      this.discount = '0',
      @required this.images,
      @required this.name,
      @required this.price,
      this.originalPrice = '1499',
      this.deliveryInfoLine1 = '',
      this.deliveryInfoLine2 = '',
      this.detail = '',
      this.count = 2});

  @override
  List<Object> get props => [
        id,
        discount,
        images,
        name,
        price,
        originalPrice,
        deliveryInfoLine1,
        deliveryInfoLine2,
        detail,
        count
      ];
}
