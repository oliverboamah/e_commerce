// flutter imports
import 'package:flutter/cupertino.dart';

// my app imports
import 'package:e_commerce/ui/models/cart_model.dart';

class CartList {
  List<CartModel> list = [];

  CartList();

  CartList.initial({@required List<CartModel> list});

  void add(CartModel cartModel) {
    this.list.add(cartModel);
  }

  void remove(CartModel cartModel) {
    this.list.remove(cartModel);
  }

  void removeAtIndex(int index) {
    this.list.removeAt(index);
  }

  CartModel get(int index) {
    return this.list[index];
  }
}
