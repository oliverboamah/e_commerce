// flutter imports
import 'package:flutter/cupertino.dart';

class ProductModel {
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
}
