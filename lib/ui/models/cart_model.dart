// flutter imports
import 'package:flutter/widgets.dart';

// my app imports
import 'package:e_commerce/ui/models/product_model.dart';

class CartModel {
  final ProductModel productModel;
  final String status;
  final int quantity;
  final String delivery;

  CartModel(
      {@required this.productModel,
      this.status = 'pending',
      this.quantity = 1,
      this.delivery = ''});
}
