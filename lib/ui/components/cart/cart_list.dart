// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/models/cart_model_list.dart';
import 'package:e_commerce/ui/components/cart/cart_item.dart';

class CartList extends StatelessWidget {
  final CartModelList cartModelList;
  final Function onItemClicked;

  CartList({@required this.cartModelList, @required this.onItemClicked});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.cartModelList.size(),
      itemBuilder: (context, index) {
        return CartItem(
          cartModel: this.cartModelList.get(index),
        );
      },
    );
  }
}
