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

  ProductModel(
      {this.id = 0,
      this.discount = '0',
      @required this.images,
      @required this.name,
      @required this.price,
      this.originalPrice = '1499'});

  @override
  List<Object> get props => [id, discount, images, name, price, originalPrice];
}
