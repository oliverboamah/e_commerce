// flutter imports
import 'package:e_commerce/presentation/widgets/wishlist/wish_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/domain/models/product_model.dart';

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
