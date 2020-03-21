// flutter imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// my app imports
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/presentation/features/home/tabs/product/views/product_item_view.dart';

class ProductListView extends StatelessWidget {
  final List<ProductModel> productModelList;
  final Function onItemClicked;

  ProductListView({this.productModelList, this.onItemClicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: OrientationBuilder(
          builder: (context, orientation) {
            return GridView.count(
              childAspectRatio: (1 / 1.1),
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
              children: List.generate(this.productModelList.length, (index) {
                return InkWell(
                  child: ProductItemView(
                    productModel: this.productModelList[index],
                  ),
                  onTap: () => this.onItemClicked(index),
                );
              }),
            );
          },
        ));
  }
}
