// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/models/product_model.dart';
import 'package:e_commerce/ui/components/wishlist/wish_item.dart';

class WishList extends StatelessWidget {
  final List<ProductModel> productModels;
  final Function onItemClicked;

  WishList({@required this.productModels, @required this.onItemClicked});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.productModels.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: WishItem(
            productModel: this.productModels[index],
          ),
          onTap: () => this.onItemClicked(index),
        );
      },
    );
  }
}
