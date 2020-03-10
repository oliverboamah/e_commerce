// flutter imports
import 'package:flutter/cupertino.dart';

// my app imports
import 'package:e_commerce/domain/models/cart_model.dart';

class CartModelList {
  List<CartModel> list = [];

  CartModelList();

  CartModelList.initial({@required this.list});

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

  int size() {
    return this.list.length;
  }
}
