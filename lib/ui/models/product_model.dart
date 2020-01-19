// flutter imports
import 'package:flutter/cupertino.dart';

class ProductModel {
  final String discount;
  final String image;
  final String name;
  final String price;

  ProductModel(
      {this.discount = '0',
      @required this.image,
      @required this.name,
      @required this.price});
}
