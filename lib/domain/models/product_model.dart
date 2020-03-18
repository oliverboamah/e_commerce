// flutter imports
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class ProductModel extends Equatable {
  final String discount;
  final List<String> images;
  final String name;
  final String price;
  final String originalPrice;

  ProductModel(
      {this.discount = '0',
      @required this.images,
      @required this.name,
      @required this.price,
      this.originalPrice = '1499'});

  @override
  List<Object> get props => [discount, images, name, price, originalPrice];
}
