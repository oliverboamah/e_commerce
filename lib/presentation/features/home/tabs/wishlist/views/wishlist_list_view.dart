// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/presentation/features/home/tabs/wishlist/views/wishlist_item_view.dart';

class WishListListView extends StatelessWidget {
  final List<ProductModel> productModels;
  final Function onItemClicked;

  WishListListView(
      {@required this.productModels, @required this.onItemClicked});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.productModels.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: WishlistItem(
            productModel: this.productModels[index],
          ),
          onTap: () => this.onItemClicked(index),
        );
      },
    );
  }
}
