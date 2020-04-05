// flutter imports
import 'package:flutter/cupertino.dart';

// my app imports
import 'package:e_commerce/domain/models/cart_model.dart';
import 'package:e_commerce/domain/models/product_model.dart';

class CartModelList {
  List<CartModel> list = [];

  CartModelList();

  CartModelList.initial({@required this.list});

  void add(CartModel cartModel) {
    int index = this.indexOf(cartModel);
    if (index > -1) {
      this.list[index] = CartModel(
          productModel: cartModel.productModel,
          quantity: cartModel.quantity + 1,
          delivery: cartModel.delivery,
          status: cartModel.status);
    } else {
      this.list.add(cartModel);
    }
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

  List<CartModel> all() {
    return this.list;
  }

  int size() {
    return this.list.length;
  }

  void update(CartModel cartModel) {
    for (int index = 0; index < this.list.length; index++) {
      if (cartModel.productModel.id == this.list[index].productModel.id) {
        this.list[index] = cartModel;
      }
    }
  }

  int indexOf(CartModel cartModel) {
    for (int i = 0; i < this.list.length; i++) {
      if (this.list[i].productModel.id == cartModel.productModel.id) {
        return i;
      }
    }
    return -1;
  }

  void updateIndex(int index, CartModel cartModel) {
    this.list[index] = cartModel;
  }

  CartModel search(ProductModel productModel) {
    for (int index = 0; index < this.list.length; index++) {
      if (productModel.id == this.list[index].productModel.id) {
        return this.list[index];
      }
    }
    return CartModel(productModel: productModel, quantity: 1);
  }
}
