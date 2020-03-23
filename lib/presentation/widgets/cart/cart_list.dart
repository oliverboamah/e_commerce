// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/domain/models/cart_model_list.dart';
import 'package:e_commerce/presentation/widgets/cart/cart_item.dart';
import 'package:e_commerce/domain/models/cart_model.dart';

class CartList extends StatelessWidget {
  final CartModelList cartModelList;
  final Function onItemClicked;
  final Function onProductChanged;

  CartList(
      {@required this.cartModelList,
      @required this.onItemClicked,
      @required this.onProductChanged});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.cartModelList.size(),
      itemBuilder: (context, index) {
        return CartItem(
          onProductChanged: (CartModel cartModel) =>
              this.onProductChanged(index, cartModel),
          cartModel: this.cartModelList.get(index),
        );
      },
    );
  }
}
